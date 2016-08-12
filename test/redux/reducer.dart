import 'package:test/test.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'helpers.dart';

class ReducerTests {
  static run() {
    group('Redux combine reducers', () {
      test('Should return a composite reducer', () {
        Reducer reducer1 = (State state, Action action) =>
            action.type == FIRST_ACTION ? (new State.from(state)..['reducer1'] = 'passed') : state;

        Reducer reducer2 = (State state, Action action) =>
            action.type == FIRST_ACTION ? (new State.from(state)..['reducer2'] = 'passed') : state;

        Reducer combined = combineReducers([reducer1, reducer2]);

        var result = combined(State.emptyState, testAction);
        expect(result, {'reducer1': 'passed', 'reducer2': 'passed'});
      });

      test('Should return a composite reducer that maps the state keys to given reducers', () {
        Reducer reducer1 = (State state, Action action) =>
            action.type == FIRST_ACTION ? (new State.from(state)..['reducer1'] = 'passed') : state;

        Reducer reducer2 = (State state, Action action) =>
            action.type == SECOND_ACTION ? (new State.from(state)..['reducer2'] = 'passed') : state;

        Reducer combined = combineReducers([reducer1, reducer2]);

        expect(combined(State.emptyState, new Action(FIRST_ACTION)), {'reducer1': 'passed'});
        expect(combined(State.emptyState, new Action(SECOND_ACTION)), {'reducer2': 'passed'});
      });

      test('Should return initial state if no reducers passed to compose function', () {
        Reducer combined = combineReducers([]);
        expect(combined(testState, new Action(FIRST_ACTION)), testState);
      });
    });
  }
}

void main() {
  ReducerTests.run();
}
