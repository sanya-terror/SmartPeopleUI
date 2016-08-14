library users.sign_up;

import 'package:redstone/redstone.dart' as app;

@app.Group('/')
class SignUpService {

  @app.Route('create-account', methods: const [app.POST])
  createAccount(@app.Body(app.JSON) Map body) {
    Map signUpData = body['signUpData'];
    String user = signUpData['user'];
    String password = signUpData['password'];

    if (user != 'test@test.con')
      return { 'token': '${user}_${password}'};

    int userAlreadyExists = 3333;

    return {'errorCode': userAlreadyExists};
  }

  @app.Route('resend-code', methods: const [app.POST])
  resendCode(@app.Body(app.JSON) Map body) {
    String token = body['token'];

    if (token == 'test@test.com_777777')
      return {};

    int resendConfirmationCodeError = 5555;
    return { 'errorCode': resendConfirmationCodeError};
  }

  @app.Route('confirm', methods: const [app.POST])
  confirm(@app.Body(app.JSON) Map body) {
    String code = body['code'];

    if (code == '12345678')
      return {};

    int invalidCodeErrorCode = 4444;
    return { 'errorCode': invalidCodeErrorCode};
  }
}