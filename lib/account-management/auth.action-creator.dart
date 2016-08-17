import 'package:SmartPeopleUI/redux/index.dart' show Action;
import 'package:SmartPeopleUI/shared/actions.dart'
    show LOGIN_CHECK, LOGIN_SUCCESS, LOGOUT_SUCCESS, LOGOUT_REQUEST,
    LOGIN_REQUEST, LOGIN_FAILURE;

class AuthActionCreator {
  static Action requestLogin(credentials) {
    return new Action(LOGIN_REQUEST,
        {
          'user': credentials['user'],
          'password': credentials['password'],
          'rememberMe': credentials['rememberMe']
        });
  }

  static Action receiveLogin() {
    return new Action(LOGIN_SUCCESS);
  }

  static Action requestLogout() {
    return new Action(LOGOUT_REQUEST);
  }

  static Action logoutSuccess() {
    return new Action(LOGOUT_SUCCESS);
  }

  static Action loginError(errorCode) {
    return new Action(LOGIN_FAILURE, {'errorCode': errorCode});
  }

  static Action checkLogin() {
    return new Action(LOGIN_CHECK);
  }
}
