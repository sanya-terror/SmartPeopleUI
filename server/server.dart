import 'package:redstone/redstone.dart' as app;
import 'dart:io';
import 'package:shelf/shelf.dart' as shelf;

@app.Group("/api")
class DemoService {

  @app.Route("authorize", methods: const [app.POST])
  authorize(@app.Body(app.JSON) Map body) {
    String user = body['user'];
    String password = body['password'];

    var invalidCredentialsErrorCode = 7777;
    if (user != 'test@test.com' || password != '777777')
      return {'errorCode': invalidCredentialsErrorCode};

    return { 'token': '${user}_${password}' };
  }

  @app.Route("getCode", methods: const [app.POST])
  getCode(@app.Body(app.JSON) Map body) {
    String email = body['email'];

    if (email == 'test@test.com')
      return {};

    var userNotFoundErrorCode = 1111;
    return { 'errorCode': userNotFoundErrorCode };
  }

  @app.Route("handleSignUpData", methods: const [app.POST])
  getConfirmCode(@app.Body(app.JSON) Map body) {
    Map signUpData  = body['signUpData'];
    String user = signUpData['user'];
    String password = signUpData['password'];

    if (user != 'test@test.con')
      return { 'token': '${user}_${password}' };

    int userAlreadyExists = 3333;

    return {'errorCode': userAlreadyExists};
  }

  @app.Route("resendConfirmCode", methods: const [app.POST])
  resendConfirmCode(@app.Body(app.JSON) Map body) {
    String token = body['token'];

    if (token == 'test@test.com_777777')
      return {};

    int resendConfirmationCodeError = 5555;
    return { 'errorCode': resendConfirmationCodeError };
  }

  @app.Route("applyCode", methods: const [app.POST])
  applyCode(@app.Body(app.JSON) Map body) {
    String code = body['code'];

    if (code == '12345678')
      return { 'token': 'restore_token_$code' };
    
    if (code == '12345679')
      return new shelf.Response.notFound('not found');

    int invalidCodeErrorCode = 2222;
    return { 'errorCode': invalidCodeErrorCode };
  }

  @app.Route("applyConfirmationCode", methods: const [app.POST])
  applyConfirmationCode(@app.Body(app.JSON) Map body) {
    String code = body['code'];

    if (code == '12345678')
      return { };

    int invalidCodeErrorCode = 4444;
    return { 'errorCode': invalidCodeErrorCode };
  }

  @app.Route("applyPasswordChanging", methods: const [app.POST])
  applyPasswordChanging(@app.Body(app.JSON) Map body) {
    String oldPassword = '111111';
    String password = body['password'];
    String token = body['token'];

    if (password != oldPassword && token == 'restore_token_12345678')
      return { };

    int passwordChangeErrorCode = 3333;
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
    'Access-Control-Allow-Headers': 'Origin, X-Requested-With, Content-Type, Accept, Autorization'
  });
}

main() {
  app.setupConsoleLog();

  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 9999 : int.parse(portEnv);

  app.start(port: port);
}
