import 'package:test/test.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'helpers.dart';

class StoreTests {
  static run() {
    group('Redux store', () {
      test('Should return initial state', () {
        Store store = new Store(emptyReducer, initialState: testState);
        expect(store.state, testState);
      });

      test('Should not throw if action type is empty', () {
        Store store = new Store(emptyReducer, initialState: testState);
        expect(() => store.dispatch(new Action('')), returnsNormally);
      });

      test('Should return init empty state', () {
        Store store = new Store(null);
        expect(store.state, {});
      });

      test('Should throw exception if initial state is null', () {
        expect(() => new Store(null, initialState: null), throwsArgumentError);
      });

      test('Should apply reducer', () {
        Store store = new Store(testReducer);

        expect(store.state, {});

        store.dispatch(testAction);

        expect(store.state, {'reducerApplied': true});
      });

      test('Should apply reducer to the previous state', () {
        Store store = new Store(testReducer);

        store.dispatch(testAction);
        expect(store.state, {'reducerApplied': true});

        store.dispatch(addRecordAction('Hello'));
        expect(store.state, {
          'reducerApplied': true,
          'list': [
            {'message': 'Hello'}
          ]
        });

        store.dispatch(addRecordAction('World'));
        expect(store.state, {
          'reducerApplied': true,
          'list': [
            {'message': 'Hello'},
            {'message': 'World'},
          ]
        });
      });

      test('Should notify subscribers about state change', () {
        Store store = new Store(testReducer, initialState: testState);

        store.subscribe(() {
          expect(store.state, {'initialized': true, 'meaningOfLife': 42, 'reducerApplied': true});
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

      test('Should apply middleware before reducers', () {
        Middleware middleware = (Store store) {
          expect(store.state, testState);
          return (next) => (action) => next(addRecordAction('String from middleware'));
        };

        Store store = new Store(testReducer, initialState: testState, middleware: middleware);
        store.dispatch(addRecordAction("Will not be added"));

        expect(store.state, {
          'initialized': true,
          'meaningOfLife': 42,
          'list': [
            {'message': 'String from middleware'}
          ]
        });
      });

      test('Should return function from middleware and not modify data', () {
        bool callbackCalled = false;

        Middleware middleware = (store) => (next) => (action) {
              return () {
                callbackCalled = true;
              };
            };

        Store store = new Store(testReducer, initialState: testState, middleware: middleware);
        var callbackFunction = store.dispatch(addRecordAction("Will not be added"));

        callbackFunction();

        expect(store.state, testState);
        expect(callbackCalled, true);
      });
    });
  }
}

void main() {
  StoreTests.run();
}
