import 'package:test/test.dart';
import 'package:smartpeople_client/redux/index.dart';
import 'helpers.dart';
import 'dart:async';

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

      test('Should apply reducer', () async {
        Store store = new Store(testReducer);

        expect(store.state, {});

        await store.dispatch(testAction);

        expect(store.state, {'reducerApplied': true});
      });

      test('Should apply reducer to the previous state', () async {
        Store store = new Store(testReducer);

        await store.dispatch(testAction);
        expect(store.state, {'reducerApplied': true});

        await store.dispatch(addRecordAction('Hello'));
        expect(store.state, {
          'reducerApplied': true,
          'list': [
            {'message': 'Hello'}
          ]
        });

        await store.dispatch(addRecordAction('World'));
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

        store.listen((State state) {
          expect(state, {'initialized': true, 'meaningOfLife': 42, 'reducerApplied': true});
          expect(store.state, state);
        });
        store.dispatch(testAction);
      });

      test('Should be able to unsubscribe', () async {
        var listener = new ListenerMock();
        Store store = new Store(testReducer);

        var subscription = store.listen(listener);

        await await store.dispatch(unknownAction);
        expect(listener.calls, 1);
        await await store.dispatch(unknownAction);
        expect(listener.calls, 2);

        subscription.cancel();

        await await store.dispatch(unknownAction);
        expect(listener.calls, 2);
      });

      test('Should support multiple subscriptions', () async {
        Store store = new Store(testReducer);
        var listenerA = new ListenerMock();
        var listenerB = new ListenerMock();

        var subscriptionA = store.listen(listenerA);

        await await store.dispatch(unknownAction);
        expect(listenerA.calls, 1);
        expect(listenerB.calls, 0);

        await await store.dispatch(unknownAction);
        expect(listenerA.calls, 2);
        expect(listenerB.calls, 0);

        var subscriptionB = store.listen(listenerB);
        expect(listenerA.calls, 2);
        expect(listenerB.calls, 0);

        await await store.dispatch(unknownAction);
        expect(listenerA.calls, 3);
        expect(listenerB.calls, 1);

        subscriptionA.cancel();
        expect(listenerA.calls, 3);
        expect(listenerB.calls, 1);

        await await store.dispatch(unknownAction);
        expect(listenerA.calls, 3);
        expect(listenerB.calls, 2);

        subscriptionB.cancel();
        expect(listenerA.calls, 3);
        expect(listenerB.calls, 2);

        await await store.dispatch(unknownAction);
        expect(listenerA.calls, 3);
        expect(listenerB.calls, 2);

        subscriptionA = store.listen(listenerA);
        expect(listenerA.calls, 3);
        expect(listenerB.calls, 2);

        await await store.dispatch(unknownAction);
        expect(listenerA.calls, 4);
        expect(listenerB.calls, 2);
      });

      test('Should support subscriptions lifecycle', () async {
        Store store = new Store(testReducer);
        var listener = new ListenerMock();
        StreamSubscription<State> subscription = store.listen(listener);

        await await store.dispatch(unknownAction);
        expect(listener.calls, 1, reason: 'Call listener on data received');

        subscription.pause();
        await await store.dispatch(unknownAction);
        expect(listener.calls, 1, reason: 'Do not call listener if paused');

        subscription.resume();
        await await store.dispatch(unknownAction);
        expect(listener.calls, 3, reason: 'Receive all missed messages if resumed');

        subscription.cancel();
        await await store.dispatch(unknownAction);
        expect(listener.calls, 3, reason: 'Do not call listener if canceled');

        subscription.resume();
        await await store.dispatch(unknownAction);
        expect(listener.calls, 3, reason: 'Will not resume if canceled previously');

        subscription = store.listen(listener);
        await await store.dispatch(unknownAction);
        expect(listener.calls, 4, reason: 'Call listener on data received in new subscription');
      });

      test('Should only remove listener once when unsubscribe is called', () async {
        Store store = new Store(testReducer);
        var listenerA = new ListenerMock();
        var listenerB = new ListenerMock();

        var subscriptionA = store.listen(listenerA);
        store.listen(listenerB);

        subscriptionA.cancel();
        subscriptionA.cancel();

        await await store.dispatch(unknownAction);
        expect(listenerA.calls, 0);
        expect(listenerB.calls, 1);
      });

      test('Should only remove relevant listener when unsubscribe is called', () async {
        Store store = new Store(testReducer);
        var listener = new ListenerMock();

        store.listen(listener);
        var subscriptionB = store.listen(listener);

        subscriptionB.cancel();
        subscriptionB.cancel();

        await await store.dispatch(unknownAction);
        expect(listener.calls, 1);
      });

      test('Should recover from an error within a reducer', () async {
        Store store = new Store(testReducer);

        expect(store.dispatch(errorAction), throws);
        expect(() async => await store.dispatch(unknownAction), returnsNormally);
      });

      test('Should apply middleware before reducers', () async {
        var newAction = addRecordAction('String from middleware');

        Middleware middleware = (Store store) {
          expect(store.state, testState);
          return (next) => (action) => action != newAction ? next(newAction) : next(action);
        };

        Store store = new Store(testReducer, initialState: testState, middleware: middleware);
        await store.dispatch(addRecordAction("Will not be added"));

        expect(store.state, {
          'initialized': true,
          'meaningOfLife': 42,
          'list': [
            {'message': 'String from middleware'}
          ]
        });
      });

      test('Should reset middleware executing state if midleware reject chain', () async {
        var ACTION_TO_REJECT = 'ACTION_TO_REJECT';
        var newAction = addRecordAction('String from middleware');

        Middleware rejectingMiddleware = (store) => (next) => (action) {
          if (action.type == ACTION_TO_REJECT) return {};
          return action != newAction ? next(newAction) : next(action);
        };

        Store store = new Store(testReducer, initialState: testState, middleware: rejectingMiddleware);
        await store.dispatch(new Action(ACTION_TO_REJECT));
        await store.dispatch(addRecordAction("Will not be added"));

        expect(store.state, {
          'initialized': true,
          'meaningOfLife': 42,
          'list': [
            {'message': 'String from middleware'}
          ]
        });
      });

      test('Should reset middleware executing state if midleware throw error', () async {
        var ACTION_TO_ERROR = 'ACTION_TO_ERROR';
        var newAction = addRecordAction('String from middleware');

        Middleware errorMiddleware = (store) => (next) => (action) {
          if (action.type == ACTION_TO_ERROR) throw new Error();
          return action != newAction ? next(newAction) : next(action);
        };

        Store store = new Store(testReducer, initialState: testState, middleware: errorMiddleware);

        expect(store.dispatch(new Action(ACTION_TO_ERROR)), throws);
        await store.dispatch(addRecordAction("Will not be added"));

        expect(store.state, {
          'initialized': true,
          'meaningOfLife': 42,
          'list': [
            {'message': 'String from middleware'}
          ]
        });
      });

      test('Should apply middleware when several async actions are dispatching', () async {
        var separatorAction = addRecordAction('Separator');
        Middleware middleware = (store) => (next) => (action) {
          if (action != separatorAction) {
            next(separatorAction);
          }
          return next(action);
        };

        Store store = new Store(testReducer, initialState: testState, middleware: middleware);

        store.dispatch(addRecordAction("Line 1"));
        store.dispatch(addRecordAction("Line 2"));
        await await store.dispatch(addRecordAction("Final"));

        expect(store.state, {
          'initialized': true,
          'meaningOfLife': 42,
          'list': [
            {'message': 'Line 1'},
            {'message': 'Separator'},
            {'message': 'Line 2'},
            {'message': 'Separator'},
            {'message': 'Final'},
            {'message': 'Separator'},
          ]
        });
      });

      test('Should return function from middleware and not modify data', () async {
        bool callbackCalled = false;

        Middleware middleware = (store) => (next) => (action) async {
              return () {
                callbackCalled = true;
              };
            };

        Store store = new Store(testReducer, initialState: testState, middleware: middleware);
        var callbackFunction = await store.dispatch(addRecordAction("Will not be added"));

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
