import 'package:redstone/redstone.dart' as app;
import 'dart:io';

@app.Group("/api")
class DemoService {

  @app.Route("authorize", methods: const [app.POST])
  authorize(@app.Body(app.JSON) Map body) {
    Map credentials = body['credentials'];
    String user = credentials['user'];
    String password = credentials['password'];

    if (user != 'test@test.com' || password != '777777')
      return {'error': 'Inserted credentials are invalid'};

    return { 'token': '${credentials['user']}_${credentials['password']}' };
  }

  @app.Route("getCode", methods: const [app.POST])
  getCode(@app.Body(app.JSON) Map body) {
    String email = body['email'];

    if (email == 'test@test.com')
      return {};

    var userNotFoundErrorCode = 1111;
    return { 'errorCode': userNotFoundErrorCode };
  }

  @app.Route("handleSignUpForm", methods: const [app.POST])
  getConfirmCode(@app.Body(app.JSON) Map body) {
    Map credentials = body['credentials'];
    String user = credentials['user'];
    String password = credentials['password'];

    if (user != 'test@test.con')
      return {
        'token': '${user}_${password}'
      };

    var userAlreadyExists = 3333;
    return { 'errorCode': userAlreadyExists };
  }

  @app.Route("applyCode", methods: const [app.POST])
  applyCode(@app.Body(app.JSON) Map body) {
    String code = body['code'];

    if (code == '12345678')
      return { 'token': 'restore_token_$code' };

    var invalidCodeErrorCode = 2222;
    return { 'errorCode': invalidCodeErrorCode };
  }

  @app.Route("applyConfirmationCode", methods: const [app.POST])
  applyConfirmationCode(@app.Body(app.JSON) Map body) {
    String code = body['code'];

    if (code == '12345678')
      return { };

    var invalidCodeErrorCode = 4444;
    return { 'errorCode': invalidCodeErrorCode };
  }

  @app.Route("applyPasswordChanging", methods: const [app.POST])
  applyPasswordChanging(@app.Body(app.JSON) Map body) {
    String oldPassword = '111111';
    String password = body['password'];
    String token = body['token'];

    if (password != oldPassword && token == 'restore_token_12345678')
      return { };

    var passwordChangeErrorCode = 3333;
    return { 'errorCode': passwordChangeErrorCode };
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
