import 'package:SmartPeopleUI/redux/index.dart';

Map<String, dynamic> testState = {'initialized': true, 'meaningOfLife': 42};

const FIRST_ACTION = 'FIRST_ACTION';
const ADD_RECORD = 'ADD_RECORD';
const ERROR = 'ERROR';

addRecordAction(text) => new Action(ADD_RECORD, { 'text': text});
get testAction => new Action(FIRST_ACTION);
get unknownAction => new Action('UNKNOWN');
get errorAction => new Action('ERROR');

Map<String, dynamic> emptyReducer(Map<String, dynamic> state, Action action) => state;

Map<String, dynamic> testReducer(Map<String, dynamic> state, Action action) {
  switch (action.type) {
    case FIRST_ACTION:
      return new Map.from(state)..['reducerApplied'] = true;

    case ADD_RECORD:
      var result = new Map.from(state);
      var newRecord = {'message': action.data['text']};
      if (result.containsKey('list')) {
        (result['list'] as List<Map<String, dynamic>>).add(newRecord);
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
