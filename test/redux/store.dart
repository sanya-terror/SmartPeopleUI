import 'package:test/test.dart';
import 'package:SmartPeopleUI/redux/index.dart';

const FIRST_ACTION = 'FIRST_ACTION';

class TestAction extends Action{
  String type = FIRST_ACTION;
}

Map<String, dynamic> testReducer(Map<String, dynamic> state, Action action) {
  switch (action.type) {
    case FIRST_ACTION:
      return {'reducerApplied': true};
    default:
      return state;
  }
}

Map<String, dynamic> failReducer(Map<String, dynamic> state, Action action) {
  throw new Error();
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
        Store store = new Store(failReducer, testState);
        store.dispatch(new TestAction());
        expect(store.getState(), testState);
      });
    });
  }
}

void main() {
  StoreTests.run();
}








