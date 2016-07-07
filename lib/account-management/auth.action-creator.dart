import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/actions.dart';

class AuthActionCreator {
  static Action requestLogin(credentials) {
    return new Action(LOGIN_REQUEST, {
      'user': credentials['user'],
      'password': credentials['password'],
      'rememberMe': credentials['rememberMe']
    });
  }

  static Action receiveLogin() {
    return new Action(LOGIN_SUCCESS);
  }

  static Action loginError(errorCode) {
    return new Action(LOGIN_FAILURE, {'errorCode': errorCode});
  }

  static Action checkLogin(){
    return new Action(LOGIN_CHECK);
  }
}
