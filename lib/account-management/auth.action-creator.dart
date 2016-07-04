import 'package:SmartPeopleUI/redux/index.dart';

const LOGIN_REQUEST = 'LOGIN_REQUEST';
const LOGIN_SUCCESS = 'LOGIN_SUCCESS';
const LOGIN_FAILURE = 'LOGIN_FAILURE';
const LOGIN_CHECK = 'LOGIN_CHECK';
const LOGOUT_SUCCESS = 'LOGOUT_SUCCESS';

class AuthActionCreator {
  static Action requestLogin(credentials) {
    return new Action(LOGIN_REQUEST, {'credentials': credentials});
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
