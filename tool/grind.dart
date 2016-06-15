import 'dart:async';
import 'dart:io';

import 'package:grinder/grinder.dart';
import 'package:git/git.dart';

void main(List<String> args) {
  grind(args);
}

@Task()
@Depends(analyze, testTravis)
void travis() {}

//@DefaultTask()
//@Depends(analyze, format, test, updateDemo)
//void prePush() {}

@Task()
void analyze() {
  Analyzer.analyze(existingSourceDirs);
}

//@Task('Apply dartfmt to all Dart source files')
//void format() {
//  DartFmt.format(existingSourceDirs);
//}

@Task()
test() async {
  final platforms = ['firefox'];
  await runTestsWithPubServe(platforms);
}
//
//@Task('Test dartfmt for all Dart source files')
//void testFormat() {
//  if (DartFmt.dryRun(existingSourceDirs)) {
//    throw "dartfmt failure";
//  }
//}

@Task()
testTravis() async {
  // travis only supports firefox and content-shell it seems
  final platforms = ['firefox'];
  await runTestsWithPubServe(platforms);
}
//
//@Task()
//Future updateDemo() async {
//  await Pub.run('peanut', arguments: ['--directory', 'web']);
//  await runGit(['push', 'origin', 'gh-pages']);
//}

runTestsWithPubServe(List<String> platforms) async {
  final arguments = ['serve', 'test', '--port', '3000'];
  final process = await Process.start('pub', arguments, runInShell: true);

  process.stderr.map(SYSTEM_ENCODING.decode).forEach(stderr.write);

  await process.stdout
      .map(SYSTEM_ENCODING.decode)
      .firstWhere((string) => string.contains("Build completed successfully"));

  try {
    await new TestRunner()
        .testAsync(platformSelector: platforms, pubServe: 3000);
    process.kill();
  } catch (e) {
    process.kill();
  }
}