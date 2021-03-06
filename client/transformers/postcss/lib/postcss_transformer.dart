library postcss_transformer;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:barback/barback.dart';

class _Configuration {
  final String executable;
  final String inputExtension;
  final String outputExtension;
  final List<String> executableArgs;

  _Configuration._({this.executable, this.inputExtension, this.outputExtension, this.executableArgs});

  factory _Configuration.fromConfig(Map<String, dynamic> config) {
    final String executable = config['executable'] ?? 'postcss';
    final String inputExtension = config['input_extension'] ?? '.css';
    final String outputExtension = config['output_extension'] ?? inputExtension;

    if (!config.containsKey('arguments')) {
      throw new ArgumentError('arguments must be provided');
    }

    final List<String> executableArgs = [];
    final Iterable<Map<String, String>> arguments = config['arguments'] as Iterable<Map<String, String>>;
    arguments.forEach((Map<String, String> argument) {
      argument.forEach((String k, String v) {
        executableArgs.add('--$k');
        executableArgs.add(v.toString());
      });
    });

    return new _Configuration._(
        executable: executable,
        inputExtension: inputExtension,
        outputExtension: outputExtension,
        executableArgs: executableArgs);
  }

  @override
  String toString() => "<_Configuration "
      "executable:$executable "
      "inputExtension:$inputExtension "
      "outputExtension:$outputExtension>";
}

class PostcssTransformer extends Transformer implements DeclaringTransformer {
  final _Configuration _configuration;

  PostcssTransformer.asPlugin(BarbackSettings s)
      : _configuration = new _Configuration.fromConfig(s.configuration as Map<String, dynamic>);

  @override
  String get allowedExtensions => _configuration.inputExtension;

  @override
  Future apply(Transform transform) async {
    final Asset asset = transform.primaryInput;

    final Process process =
        await Process.start(_configuration.executable, _configuration.executableArgs, runInShell: true);

    asset.read().pipe(process.stdin);

    process.stdout.listen((data) {
      final AssetId newId = _outputId(asset.id);
      transform.addOutput(new Asset.fromBytes(newId, data));
    });

    process.stderr.transform(UTF8.decoder).listen((data) {
      final String command = "${_configuration.executable} ${_configuration.executableArgs.join(" ")}";
      transform.logger.error("Command: $command\nstderr:\n$data", asset: asset.id);
    });

    // SP-105, workaround to process large css files on Windows
    sleep(new Duration(milliseconds: 500));

    var exitCode = await process.exitCode;
    transform.logger.info('Finished with exit code $exitCode', asset: asset.id);
  }

  @override
  void declareOutputs(DeclaringTransform transform) {
    transform.declareOutput(_outputId(transform.primaryId));
  }

  AssetId _outputId(AssetId inputId) {
    if (_configuration.inputExtension != _configuration.outputExtension) {
      return inputId.changeExtension(_configuration.outputExtension);
    } else {
      return inputId;
    }
  }
}
