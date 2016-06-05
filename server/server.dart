import 'package:redstone/redstone.dart' as app;
import 'dart:io';

@app.Group("/api")
class DemoService {

  @app.Route("authorize", methods: const [app.POST])
  authorize(@app.Body(app.JSON) Map body) {
    Map credentials = body['credentials'];
    return { 'token': '${credentials['user']}_${credentials['password']}' };
  }
}

@app.ErrorHandler(HttpStatus.NOT_FOUND)
@app.ErrorHandler(HttpStatus.BAD_REQUEST)
handleNotFoundError() => app.redirect("/");

@app.Interceptor(r'/.*')
handleCORS() async {
  if (app.request.method != "OPTIONS") {
    await app.chain.next();
  }
  return app.response.change(headers: {
    "Access-Control-Allow-Origin": "*",
    'Access-Control-Allow-Headers': 'Origin, X-Requested-With, Content-Type, Accept'
  });
}

main() {
  app.setupConsoleLog();

  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 9999 : int.parse(portEnv);

  app.start(port: port);
}
