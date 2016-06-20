import 'package:redstone/redstone.dart' as app;
import 'dart:io';

@app.Group("/api")
class DemoService {

  @app.Route("authorize", methods: const [app.POST])
  authorize(@app.Body(app.JSON) Map body) {
    Map credentials = body['credentials'];
    return { 'token': '${credentials['user']}_${credentials['password']}' };
  }

  @app.Route("getCode", methods: const [app.POST])
  getCode(@app.Body(app.JSON) Map body) {
    String email = body['email'];

    if (email == 'test@test.com')
      return { 'codeSent': true };

    return { 'userNotFound': true };
  }

  @app.Route("applyCode", methods: const [app.POST])
  applyCode(@app.Body(app.JSON) Map body) {
    String code = body['code'];

    if (code == '123')
      return { 'token': 'restore_token_$code' };

    return { 'invalidCode': true };
  }

  @app.Route("applyPasswordChanging", methods: const [app.POST])
  applyPasswordChanging(@app.Body(app.JSON) Map body) {
    String oldPassword = '111111';
    String password = body['password'];
    String token = body['token'];

    if (password != oldPassword && token == 'restore_token_123')
      return { 'passwordChanged': true };

    return { 'passwordChangingError': true };
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
