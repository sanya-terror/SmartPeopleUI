import 'package:test/test.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/index.dart';

class ApiErrorsReducerTests {
  static run() {
    group('Api errors reducer', () {
      group('Not found', () {
        var initialState = new State({'some': 'property', 'isResourceNotFoundError': null,});

        List<Map<String, dynamic>> cases = [
          {
            'action': new Action(ERROR_NOT_FOUND),
            'result': new State({'some': 'property', 'isResourceNotFoundError': true,})
          },
          {
            'action': new Action(ERROR_REMOVE_NOT_FOUND),
            'result': new State({'some': 'property'})
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

      group('Unauthorized', () {
        var initialState = new State({'some': 'property', 'isUnauthorizedError': null,});

        List<Map<String, dynamic>> cases = [
          {
            'action': new Action(ERROR_UNAUTHORIZED),
            'result': new State({'some': 'property', 'isUnauthorizedError': true, 'isAuthenticated': false})
          },
          {
            'action': new Action(ERROR_REMOVE_UNAUTHORIZED),
            'result': new State({'some': 'property'})
          },
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

      group('Forbidden', () {
        var initialState = new State({'some': 'property', 'isForbiddenError': null,});

        List<Map<String, dynamic>> cases = [
          {
            'action': new Action(ERROR_FORBIDDEN),
            'result': new State({'some': 'property', 'isForbiddenError': true})
          },
          {
            'action': new Action(ERROR_REMOVE_FORBIDDEN),
            'result': new State({'some': 'property'})
          },
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

      group('Internal server error', () {
        var initialState = new State(
            {'some': 'property', 'isInternalServerError': null, 'errorStackTrace': null, 'errorMessage': null});

        List<Map<String, dynamic>> cases = [
          {
            'action': new Action(ERROR_INTERNAL_SERVER,
                {'message': 'Internal server errror', 'stackTrace': 'Internal server error stack trace',}),
            'result': new State({
              'some': 'property',
              'isInternalServerError': true,
              'errorStackTrace': 'Internal server error stack trace',
              'errorMessage': 'Internal server errror'
            })
          },
          {
            'action': new Action(ERROR_REMOVE_INTERNAL_SERVER),
            'result': new State({'some': 'property'})
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

      group('Bad request', () {
        var initialState =
            new State({'some': 'property', 'isBadRequestError': null, 'errorStackTrace': null, 'errorMessage': null});

        List<Map<String, dynamic>> cases = [
          {
            'action': new Action(
                ERROR_BAD_REQUEST, {'message': 'Bad request message', 'stackTrace': 'bad request stack trace',}),
            'result': new State({
              'some': 'property',
              'isBadRequestError': true,
              'errorStackTrace': 'bad request stack trace',
              'errorMessage': 'Bad request message'
            })
          },
          {
            'action': new Action(ERROR_REMOVE_BAD_REQUEST),
            'result': new State({'some': 'property'})
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
    });
  }
}

void main() {
  ApiErrorsReducerTests.run();
}
