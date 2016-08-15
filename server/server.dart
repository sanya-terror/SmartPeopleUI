import 'package:redstone/redstone.dart' as app;
import 'dart:io';
import 'package:shelf_static/shelf_static.dart';
import 'package:shelf_proxy/shelf_proxy.dart';

@app.Install(urlPrefix: '/api')
import 'api/root_config.dart';

@app.ErrorHandler(HttpStatus.NOT_FOUND)
@app.ErrorHandler(HttpStatus.BAD_REQUEST)
handleNotFoundError() => app.redirect("/");

void main() {
  app.setupConsoleLog();

  var port = int.parse(_getConfig('PORT', '9999'));

  var webFolder = _getConfig('WEB');
  var webSite = _getConfig('SITE', 'http://localhost:8080');

  app.setShelfHandler(webFolder != null
    ? createStaticHandler(webFolder, defaultDocument: "index.html", serveFilesOutsidePath: true)
    : proxyHandler(webSite));

  app.start(port: port);
}

String _getConfig(key, [defaultValue = null]) {
  var envVariable = Platform.environment[key];
  return envVariable == null ? defaultValue : envVariable;
}