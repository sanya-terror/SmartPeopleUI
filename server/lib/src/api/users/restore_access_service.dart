library smartpeople_server.api.users.restore_access;

import 'package:redstone/redstone.dart' as app;
import 'package:shelf/shelf.dart' as shelf;

@app.Group('/')
class RestoreAccessService {

  @app.Route('send-code', methods: const [app.POST])
  sendCode(@app.Body(app.JSON) Map body) {
    String email = body['email'];

    print(email);
    if (email == 'test@test.com')
      return {};

    if (email == 'unauthorized@test.com')
      return new shelf.Response(401, body: 'Access denied');

    if (email == 'forbidden@test.com')
      return new shelf.Response(403, body: 'Such action is forbidden');

    if (email == 'badrequest@test.com')
      return new shelf.Response(400, body: 'Invalid email');

    if (email == 'internal@test.com')
      return new shelf.Response.internalServerError(body: 'I don\'t know what happened');

    var userNotFoundErrorCode = 1111;
    return { 'errorCode': userNotFoundErrorCode};
  }

  @app.Route('apply-code', methods: const [app.POST])
  applyCode(@app.Body (app.JSON) Map body) {
    String code = body['code'];

    if (code == '12345678')
      return { 'token': 'restore_token_$code'};

    if (code == '12345679')
      return new shelf.Response.notFound('not found');

    int invalidCodeErrorCode = 2222;
    return { 'errorCode': invalidCodeErrorCode};
  }

  @app.Route('change-password', methods: const [app.POST])
  changePassword(@app.Body(app.JSON) Map body) {
    String oldPassword = '111111';
    String password = body['password'];
    String token = body['token'];

    if (password != oldPassword && token == 'restore_token_12345678')
      return {};

    int passwordChangeErrorCode = 3333;
    return { 'errorCode': passwordChangeErrorCode};
  }
}
