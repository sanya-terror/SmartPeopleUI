import 'package:test/test.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'package:mockito/mockito.dart';

const FIRST_ACTION = 'FIRST_ACTION';
const ADD_RECORD = 'ADD_RECORD';
const ERROR = 'ERROR';

addRecord(text) => { 'type': ADD_RECORD, 'text': text};

get unknownAction => { 'type' : 'UNKNOWN'};
get errorAction => { 'type' : 'ERROR'};

Map<String, dynamic> emptyReducer(Map<String, dynamic> state, Map<String, dynamic> action) {
  return state;
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

class StoreTests {
  static run() {
    group('Redux store', () {

      var testAction = { 'type' : FIRST_ACTION };

      Map<String, dynamic> testState = {
        'initialized': true,
        'meaningOfLife': 42
      };

      test('Should return initial state', () {
        Store store = new Store(emptyReducer, initialState: testState);
        expect(store.getState(), testState);
      });

      test('Should throw error if action has no type', () {
        Store store = new Store(emptyReducer, initialState: testState);
        expect(() => store.dispatch({}), throwsArgumentError);
      });

      test('Should not throw if action type is falsy', () {
        Store store = new Store(emptyReducer, initialState: testState);
        expect(() => store.dispatch({ 'type': false}), returnsNormally);
        expect(() => store.dispatch({ 'type': 0}), returnsNormally);
        expect(() => store.dispatch({ 'type': null}), returnsNormally);
        expect(() => store.dispatch({ 'type': ''}), returnsNormally);
      });

      test('Should return init empty state', () {
        Store store = new Store(null);
        expect(store.getState(), {});
      });

      test('Should throw exception if initial state is null', () {
        expect(() =>  new Store(null, initialState: null), throwsArgumentError);
      });

      test('Should apply reducer', () {
        Store store = new Store(testReducer);

        expect(store.getState(), {});

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

      test('Should notify subscribers about state change', () {
        Store store = new Store(testReducer, initialState: testState);

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

        store.dispatch(unknownAction);
        expect(listener.calls, 1);
        store.dispatch(unknownAction);
        expect(listener.calls, 2);

        unsubscribe();

        store.dispatch(unknownAction);
        expect(listener.calls, 2);
      });

      test('Should support multiple subscriptions', () {
        Store store = new Store(testReducer);
        var listenerA = new ListenerMock();
        var listenerB = new ListenerMock();

        var unsubscribeA = store.subscribe(listenerA);

        store.dispatch(unknownAction);
        expect(listenerA.calls, 1);
        expect(listenerB.calls, 0);

        store.dispatch(unknownAction);
        expect(listenerA.calls, 2);
        expect(listenerB.calls, 0);

        var unsubscribeB = store.subscribe(listenerB);
        expect(listenerA.calls, 2);
        expect(listenerB.calls, 0);

        store.dispatch(unknownAction);
        expect(listenerA.calls, 3);
        expect(listenerB.calls, 1);

        unsubscribeA();
        expect(listenerA.calls, 3);
        expect(listenerB.calls, 1);

        store.dispatch(unknownAction);
        expect(listenerA.calls, 3);
        expect(listenerB.calls, 2);

        unsubscribeB();
        expect(listenerA.calls, 3);
        expect(listenerB.calls, 2);

        store.dispatch(unknownAction);
        expect(listenerA.calls, 3);
        expect(listenerB.calls, 2);

        unsubscribeA = store.subscribe(listenerA);
        expect(listenerA.calls, 3);
        expect(listenerB.calls, 2);

        store.dispatch(unknownAction);
        expect(listenerA.calls, 4);
        expect(listenerB.calls, 2);
      });

      test('Should only remove listener once when unsubscribe is called', () {
        Store store = new Store(testReducer);
        var listenerA = new ListenerMock();
        var listenerB = new ListenerMock();

        var unsubscribeA = store.subscribe(listenerA);
        store.subscribe(listenerB);

        unsubscribeA();
        unsubscribeA();

        store.dispatch(unknownAction);
        expect(listenerA.calls, 0);
        expect(listenerB.calls, 1);
      });

      test('Should only remove relevant listener when unsubscribe is called', () {
        Store store = new Store(testReducer);
        var listener = new ListenerMock();

        store.subscribe(listener);
        var unsubscribeB = store.subscribe(listener);

        unsubscribeB();
        unsubscribeB();

        store.dispatch(unknownAction);
        expect(listener.calls, 1);
      });

      test('Should recover from an error within a reducer', () {

        Store store = new Store(testReducer);

        expect(() => store.dispatch(errorAction), throws);
        expect(() => store.dispatch(unknownAction), returnsNormally);
      });

      test('Should apply enhancer before reducers', () {

        Enhancer enhancer = (Store store){
          expect(store.getState(), testState);

          store.dispatch(addRecord('String from enhancer'));

          return (next) => (action) => action;
        };

        Store store = new Store(testReducer, initialState: testState, enhancer: enhancer);
        store.dispatch(addRecord("Will not be added"));

        expect(store.getState(),  {
          'initialized': true,
          'meaningOfLife': 42,
          'list': [
            {'message': 'String from enhancer' }
          ]
        });
      });
    });
  }
}

void main() {
  StoreTests.run();
}