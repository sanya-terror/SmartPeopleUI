import 'package:test/test.dart';
import 'package:SmartPeopleUI/redux/index.dart';

const FIRST_ACTION = 'FIRST_ACTION';

class TestAction extends Action{
  String type = FIRST_ACTION;
}

Map<String, dynamic> testReducer(Map<String, dynamic> state, Action action) {
  switch (action.type) {
    case FIRST_ACTION:
      return new Map.from(state)
        ..['reducerApplied'] = true;
    default:
      return state;
  }
}

class StoreTests {
  static run() {
    group('Redux store', () {

      Map<String, dynamic> testState = {
        'initialized': true,
        'meaningOfLife': 42
      };

      test('Should return initial state', () {
        Store store = new Store(null, testState);
        expect(store.getState(), testState);
      });

      test('Should return init empty state', () {
        Store store = new Store(null);
        expect(store.getState(), {});
      });

      test('Should apply reducer', () {
        Store store = new Store(testReducer);
        store.dispatch(new TestAction());
        expect(store.getState(), {
          'reducerApplied': true
        });
      });

      test('Should not change state if reducer failed', () {
        Store store = new Store((state, action) { throw new Error(); }, testState);
        store.dispatch(new TestAction());
        expect(store.getState(), testState);
      });

      test('Should notify subscribers about state change', () {
        Store store = new Store(testReducer, testState);

        store.subscribe(() {
          expect(store.getState(),{
            'initialized': true,
            'meaningOfLife': 42,
            'reducerApplied': true
          });
        });
        store.dispatch(new TestAction());
      });


    });
  }
}

void main() {
  StoreTests.run();
}








