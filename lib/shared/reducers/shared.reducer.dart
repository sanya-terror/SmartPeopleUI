import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/actions.dart';

class SharedReducer {
  static State reduce(State state, Action action) {
    switch (action.type) {
      case SAVE_EMAIL:
        return new State.from(state)..['email'] = action.data['email'];

      default:
        return state;
    }
  }
}
