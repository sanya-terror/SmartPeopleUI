import 'package:SmartPeopleUI/redux/index.dart';

const LOGIN_REQUEST = 'LOGIN_REQUEST';
const LOGIN_SUCCESS = 'LOGIN_SUCCESS';
const LOGIN_FAILURE = 'LOGIN_FAILURE';
const LOGOUT_SUCCESS = 'LOGOUT_SUCCESS';

class AuthorizationActionCreator {

  static Action requestLogin(credentials) {
    return new Action(LOGIN_REQUEST, {'isFetching': true, 'isAuthenticated': false, 'credentials': credentials});
  }

  static Action receiveLogin(user) {
    return new Action(LOGIN_SUCCESS, { 'isFetching': false, 'isAuthenticated': true, 'id_token': user['token']});
  }

  static Action loginError(message) {
    return new Action(LOGIN_FAILURE, { 'isFetching': false, 'isAuthenticated': false, 'message': message});
  }
}