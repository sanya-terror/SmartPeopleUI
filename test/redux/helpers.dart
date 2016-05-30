import 'package:SmartPeopleUI/redux/index.dart';

State testState = new State({'initialized': true, 'meaningOfLife': 42});

const FIRST_ACTION = 'FIRST_ACTION';
const SECOND_ACTION = 'SECOND_ACTION';
const ADD_RECORD = 'ADD_RECORD';
const ERROR = 'ERROR';

addRecordAction(text) => new Action(ADD_RECORD, { 'text': text});
get testAction => new Action(FIRST_ACTION);
get unknownAction => new Action('UNKNOWN');
get errorAction => new Action('ERROR');

State emptyReducer(State state, Action action) => state;

State testReducer(State state, Action action) {
  switch (action.type) {
    case FIRST_ACTION:
      return new State.from(state)..['reducerApplied'] = true;

    case ADD_RECORD:
      var result = new State.from(state);
      var newRecord = {'message': action.data['text']};
      if (result.containsKey('list')) {
        (result['list'] as List<State>).add(newRecord);
      } else {
        result['list'] = [newRecord];
      }
      return result;

    case ERROR:
      throw new Error();

    default:
      return state;
  }
}

class ListenerMock {
  num calls = 0;
  call() {
    calls++;
  }
}
