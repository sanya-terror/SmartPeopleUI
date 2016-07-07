import 'package:test/test.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/index.dart';

class ApiErrorsReducerTests {
  static run() {
    group('Api errors reducer', () {

      var initialState = new State({
        'some':'property',
        'isResourceNotFoundError': null,
        'isUnauthorizedError': null
      });

      List<Map<String, dynamic>> cases = [
        {
          'action': new Action(ERROR_NOT_FOUND),
          'result': new State({
            'some':'property',
            'isResourceNotFoundError': true,
            'isUnauthorizedError': null
          })
        },
        {
          'action': new Action(ERROR_REMOVE_NOT_FOUND),
          'result': new State({'some':'property', 'isUnauthorizedError': null})
        },
        {
          'action': new Action(ERROR_UNAUTHORIZED),
          'result': new State({
            'some':'property',
            'isResourceNotFoundError': null,
            'isUnauthorizedError': true,
            'isAuthenticated': false
          })
        },
        {
          'action': new Action(ERROR_REMOVE_UNAUTHORIZED),
          'result': new State({'some':'property', 'isResourceNotFoundError': null})
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
