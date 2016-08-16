import 'package:smartpeople_client/redux/index.dart';
import 'package:smartpeople_client/shared/actions.dart';

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
