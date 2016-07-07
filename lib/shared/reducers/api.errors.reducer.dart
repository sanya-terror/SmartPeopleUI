import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/index.dart';

class ApiErrorsReducer {
  static State reduce(State state, Action action) {

    switch (action.type) {
      case ERROR_NOT_FOUND:
        return new State.from(state)
          ..['isResourceNotFoundError'] = true;
      case ERROR_REMOVE_NOT_FOUND:
        return new State.from(state)
          ..remove('isResourceNotFoundError');
      case ERROR_UNAUTHORIZED:
        return new State.from(state)
          ..['isAuthenticated'] = false
          ..['isUnauthorizedError'] = true;
      case ERROR_REMOVE_UNAUTHORIZED:
        return new State.from(state)
          ..remove('isUnauthorizedError');

      default:
        return state;
    }
  }
}
