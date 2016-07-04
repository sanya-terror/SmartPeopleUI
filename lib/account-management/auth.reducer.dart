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
          ..['errorCode'] = null;

      case LOGIN_FAILURE:
        print(action.data);
        return new State.from(state)
          ..['isFetching'] = false
          ..['isAuthenticated'] = false
          ..['errorCode'] = action.data['errorCode'];

      case LOGOUT_SUCCESS:
        return new State.from(state)
          ..['isFetching'] = true
          ..['isAuthenticated'] = false;

      default:
        return state;
    }
  }
}
