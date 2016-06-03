import 'package:SmartPeopleUI/redux/index.dart';

import 'auth.action-creator.dart';

class AuthReducer {

  static State reduce(State state, Action action) {

    switch (action.type) {
      case LOGIN_REQUEST:
        return new State.from(state)
          ..['isFetching'] = true
          ..['isAuthenticated'] = false
          ..['user'] = action.data['credentials'];

      case LOGIN_SUCCESS:
        return new State.from(state)
          ..['isFetching'] = false
          ..['isAuthenticated'] = true
          ..['token'] = action.data['token']
          ..['errorMessage'] = '';

      case LOGIN_FAILURE:
        return new State.from(state)
          ..['isFetching'] = false
          ..['isAuthenticated'] = false
          ..['errorMessage'] = action.data['error'];

      case LOGOUT_SUCCESS:
        return new State.from(state)
          ..['isFetching'] = true
          ..['isAuthenticated'] = false;

      default:
        return state;
    }
  }
}