import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/index.dart';

class ApiErrorsReducer {
  static State reduce(State state, Action action) {

    switch (action.type) {
      case NOT_FOUND_ERROR:
        return new State.from(state)
          ..['isResourceNotFound'] = true;
      case NOT_FOUND_ERROR_CLEAN:
        return new State.from(state)
          ..remove('isResourceNotFound');

      default:
        return state;
    }
  }
}
