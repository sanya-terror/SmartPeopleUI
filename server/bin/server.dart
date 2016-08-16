import 'dart:io';

import 'package:di/di.dart';
import 'package:redstone/redstone.dart' as app;
import 'package:shelf_static/shelf_static.dart';
import 'package:shelf_proxy/shelf_proxy.dart';

import 'package:smartpeople_server/server.dart';

@app.Install(urlPrefix: '/api')
import 'package:smartpeople_server/api.dart';

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

  app.addModule(new Module()..bind(DatabaseConnection));

  app.start(port: port);
}

String _getConfig(key, [defaultValue = null]) {
  var envVariable = Platform.environment[key];
  return envVariable == null ? defaultValue : envVariable;
}
