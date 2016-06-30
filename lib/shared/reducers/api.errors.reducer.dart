import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/index.dart';

class ApiErrorsReducer {
  static State reduce(State state, Action action) {

    switch (action.type) {
      case NOT_FOUND_ERROR:
        return new State.from(state)
          ..['isResourceNotFoundError'] = true;
      case NOT_FOUND_ERROR_CLEAN:
        return new State.from(state)
          ..remove('isResourceNotFoundError');
      case UNAUTHORIZED_ERROR:
        return new State.from(state)
          ..['isAuthenticated'] = false
          ..['isUnauthorizedError'] = true;
      case UNAUTHORIZED_ERROR_CLEAN:
        return new State.from(state)
          ..remove('isUnauthorizedError');

      default:
        return state;
    }
  }
}
