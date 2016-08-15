library users.sign_up;

import 'package:redstone/redstone.dart' as app;
import 'package:uuid/uuid.dart';
import '../../database/database.dart';
import '../../database/users_repository.dart';

@app.Group('/')
class SignUpService {

  Database db;

  SignUpService(this.db);

  @app.Route('create-account', methods: const [app.POST])
  dynamic createAccount(@app.Body(app.JSON) Map body) async {

    Map signUpData = body['signUpData'];

    var uuid = new Uuid().v4();
    String email = signUpData['user'];
    String name = signUpData['userName'];
    String password = signUpData['password'];

    if (email != 'test@test.con') {
      await db.connect();

      new UsersRepository(db)
        ..insert({
          'id': uuid,
          'name': name,
          'email': email,
          'password': password
        });

      return { 'token': uuid};
    }

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