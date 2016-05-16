import 'package:test/test.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'package:mockito/mockito.dart';

const FIRST_ACTION = 'FIRST_ACTION';
const ADD_RECORD = 'ADD_RECORD';


addRecord(text){
  return {
    'type': ADD_RECORD,
    'text': text
  };
}

Map<String, dynamic> testReducer(Map<String, dynamic> state, Map<String, dynamic> action) {
  switch (action['type']) {

    case FIRST_ACTION:
      return new Map.from(state)
        ..['reducerApplied'] = true;

    case ADD_RECORD:
      var result = new Map.from(state);
      var newRecord = {
        'message': action['text']
      };
      if (result.containsKey('list')){
        (result['list'] as List<Map<String, dynamic>>).add(newRecord);
      }
      else{
        result['list'] = [newRecord];
      }
      return result;

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

class StoreTests {
  static run() {
    group('Redux store', () {

      var testAction = { 'type' : FIRST_ACTION };

      Map<String, dynamic> testState = {
        'initialized': true,
        'meaningOfLife': 42
      };

      test('Should return initial state', () {
        Store store = new Store(null, testState);
        expect(store.getState(), testState);
      });

      test('Should throw error if action has no type', () {
        Store store = new Store(null, testState);
        expect(() => store.dispatch({}), throwsArgumentError);
      });

      test('Should return init empty state', () {
        Store store = new Store(null);
        expect(store.getState(), {});
      });

      test('Should apply reducer', () {
        Store store = new Store(testReducer);
        store.dispatch(testAction);
        expect(store.getState(), {
          'reducerApplied': true
        });
      });

      test('Should apply reducer to the previous state', () {
        Store store = new Store(testReducer);

        store.dispatch(testAction);
        expect(store.getState(), {
          'reducerApplied': true
        });

        store.dispatch(addRecord('Hello'));
        expect(store.getState(), {
          'reducerApplied': true,
          'list': [
            {'message': 'Hello' }
          ]
        });

        store.dispatch(addRecord('World'));
        expect(store.getState(), {
          'reducerApplied': true,
          'list': [
            {'message': 'Hello' },
            {'message': 'World' },
          ]
        });
      });

      test('Should not change state if reducer failed', () {
        Store store = new Store((state, action) { throw new Error(); }, testState);
        store.dispatch(testAction);
        expect(store.getState(), testState);
      });

      test('Should notify subscribers about state change', () {
        Store store = new Store(testReducer, testState);

        store.subscribe((){
          expect(store.getState(),{
            'initialized': true,
            'meaningOfLife': 42,
            'reducerApplied': true
          });
        });
        store.dispatch(testAction);
      });

      test('Should be able to unsubscribe', () {

        var listener = new ListenerMock();
        Store store = new Store(testReducer);

        var unsubscribe = store.subscribe(listener);

        store.dispatch(testAction);
        expect(listener.calls, 1);
        store.dispatch(testAction);
        expect(listener.calls, 2);

        unsubscribe();

        store.dispatch(testAction);
        expect(listener.calls, 2);
      });
    });
  }
}

void main() {
  StoreTests.run();
}








