import 'package:SmartPeopleUI/redux/index.dart';

const LOGIN_REQUEST = 'LOGIN_REQUEST';
const LOGIN_SUCCESS = 'LOGIN_SUCCESS';
const LOGIN_FAILURE = 'LOGIN_FAILURE';
const LOGOUT_SUCCESS = 'LOGOUT_SUCCESS';

class AuthActionCreator {
  static Action requestLogin(credentials) {
    return new Action(LOGIN_REQUEST, {'credentials': credentials});
  }

  static Action receiveLogin(user) {
    return new Action(LOGIN_SUCCESS, {'token': user['token']});
  }

  static Action loginError(message) {
    return new Action(LOGIN_FAILURE, {'message': message});
  }
}
