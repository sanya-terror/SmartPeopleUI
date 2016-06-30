import 'package:test/test.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/index.dart';

class ApiErrorsReducerTests {
  static run() {
    group('Api errors reducer', () {

      var initialState = new State({'some':'property', 'isResourceNotFound': null});

      List<Map<String, dynamic>> cases = [
        {
          'action': new Action(NOT_FOUND_ERROR),
          'result': new State({
            'some':'property',
            'isResourceNotFound': true
          })
        },
        {
          'action': new Action(NOT_FOUND_ERROR_CLEAN),
          'result': new State({'some':'property'})
        }
      ];

      cases.forEach((testCase) {
        var action = testCase['action'];
        var expected = testCase['result'];

        test('Should apply reducer: ${action.type}', () {
          var actual = ApiErrorsReducer.reduce(initialState, action);
          expect(actual, expected);
        });
      });
    });
  }
}

void main() {
  ApiErrorsReducerTests.run();
}
