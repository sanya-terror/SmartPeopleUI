import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/index.dart';

class ApiErrorsReducer {
  static State reduce(State state, Action action) {
    if (!(action is ApiErrorAction)) return state;

    switch (action.type) {
      case NOT_FOUND_ACTION:
        return new State.from(state)
          ..['isNotFound'] = true;

      default:
        return new State.from(state)
          ..['isUnhadledError'] = true
          ..['errorDetails'] = action.data;
    }
  }
}
