import 'authorization.action-creator.dart';

class AuthReducer {

  static Map<String, dynamic> reduce(Map<String, dynamic> state, Map<String, dynamic> action) {

    switch (action['type']) {
      case LOGIN_REQUEST:
        return new Map.from(state)
          ..['isFetching'] = true
          ..['isAuthenticated'] = false
          ..['user'] = action['credentials'];

      case LOGIN_SUCCESS:
        return new Map.from(state)
          ..['isFetching'] = false
          ..['isAuthenticated'] = true
          ..['errorMessage'] = '';

      case LOGIN_FAILURE:
        return new Map.from(state)
          ..['isFetching'] = false
          ..['isAuthenticated'] = false
          ..['errorMessage'] = action['message'];

      case LOGOUT_SUCCESS:
        return new Map.from(state)
          ..['isFetching'] = true
          ..['isAuthenticated'] = false;

      default:
        return state;
    }
  }
}