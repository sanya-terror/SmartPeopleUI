import 'authorization.action-creator.dart';
import 'package:SmartPeopleUI/redux/index.dart';

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
          ..['errorMessage'] = action.data['message'];

      case LOGOUT_SUCCESS:
        return new State.from(state)
          ..['isFetching'] = true
          ..['isAuthenticated'] = false;

      default:
        return state;
    }
  }
}