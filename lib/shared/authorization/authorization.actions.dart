const LOGIN_REQUEST = 'LOGIN_REQUEST';
const LOGIN_SUCCESS = 'LOGIN_SUCCESS';
const LOGIN_FAILURE = 'LOGIN_FAILURE';
const LOGOUT_SUCCESS = 'LOGOUT_SUCCESS';

Map<String, dynamic> requestLogin(credentials) {
  return {'type': LOGIN_REQUEST, 'isFetching': true, 'isAuthenticated': false, 'credentials': credentials};
}

Map<String, dynamic> receiveLogin(user) {
  return {'type': LOGIN_SUCCESS, 'isFetching': false, 'isAuthenticated': true, 'id_token': user.id_token};
}

Map<String, dynamic> loginError(message) {
  return {'type': LOGIN_FAILURE, 'isFetching': false, 'isAuthenticated': false, 'message': message};
}
