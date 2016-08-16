library smartpeople_server.api.users.root;

import 'package:redstone/redstone.dart' as app;

@app.Group('/')
class UsersService {
  @app.Route('login', methods: const [app.POST])
  login(@app.Body(app.JSON) Map body) {
    String user = body['user'];
    String password = body['password'];

    var invalidCredentialsErrorCode = 7777;
    if (user != 'test@test.com' || password != '777777') return {'errorCode': invalidCredentialsErrorCode};

    return {'token': '${user}_${password}'};
  }
}
