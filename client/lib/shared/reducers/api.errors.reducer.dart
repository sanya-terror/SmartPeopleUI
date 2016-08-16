import 'package:smartpeople_client/redux/index.dart';
import 'package:smartpeople_client/index.dart';

class ApiErrorsReducer {
  static State reduce(State state, Action action) {
    switch (action.type) {
      case ERROR_NOT_FOUND:
        return new State.from(state)..['isResourceNotFoundError'] = true;
      case ERROR_REMOVE_NOT_FOUND:
        return new State.from(state)..remove('isResourceNotFoundError');
      case ERROR_UNAUTHORIZED:
        return new State.from(state)
          ..['isAuthenticated'] = false
          ..['isUnauthorizedError'] = true;
      case ERROR_FORBIDDEN:
        return new State.from(state)..['isForbiddenError'] = true;
      case ERROR_REMOVE_UNAUTHORIZED:
        return new State.from(state)..remove('isUnauthorizedError');
      case ERROR_BAD_REQUEST:
        return new State.from(state)
          ..['isBadRequestError'] = true
          ..['errorStackTrace'] = action.data['stackTrace']
          ..['errorMessage'] = action.data['message'];
      case ERROR_REMOVE_BAD_REQUEST:
        return new State.from(state)..remove('isBadRequestError')..remove('errorMessage')..remove('errorStackTrace');
      case ERROR_INTERNAL_SERVER:
        return new State.from(state)
          ..['isInternalServerError'] = true
          ..['errorStackTrace'] = action.data['stackTrace']
          ..['errorMessage'] = action.data['message'];
      case ERROR_REMOVE_INTERNAL_SERVER:
        return new State.from(state)
          ..remove('isInternalServerError')
          ..remove('errorMessage')
          ..remove('errorStackTrace');
      case ERROR_REMOVE_FORBIDDEN:
        return new State.from(state)..remove('isForbiddenError');

      default:
        return state;
    }
  }
}
