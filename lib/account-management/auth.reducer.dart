import 'package:SmartPeopleUI/redux/index.dart' show State, Action;
import 'package:SmartPeopleUI/shared/actions.dart'
    show LOGIN_REQUEST, LOGOUT_SUCCESS, LOGOUT_REQUEST, LOGIN_FAILURE, LOGIN_SUCCESS;

class AuthReducer {
  static State reduce(State state, Action action) {
    switch (action.type) {
      case LOGIN_REQUEST:
        return new State.from(state)
          ..['isFetching'] = true
          ..['isAuthenticated'] = false
          ..['userData'] = action.data['credentials'];

      case LOGIN_SUCCESS:
        return new State.from(state)
          ..['isFetching'] = false
          ..['isAuthenticated'] = true
          ..['errorCode'] = null;

      case LOGIN_FAILURE:
        return new State.from(state)
          ..['isFetching'] = false
          ..['isAuthenticated'] = false
          ..['errorCode'] = action.data['errorCode'];

      case LOGOUT_REQUEST:
        return new State.from(state)
          ..['isFetching'] = true
          ..['isAuthenticated'] = true;

      case LOGOUT_SUCCESS:
        return new State.from(state)
          ..['isFetching'] = true
          ..['isAuthenticated'] = false;

      default:
        return state;
    }
  }
}
