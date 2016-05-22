import 'package:test/test.dart';
import 'package:SmartPeopleUI/shared/authorization/index.dart';

class AuthReducerTests {
  static run() {
    group('Authorization reducer', () {
      List<Map<String, dynamic>> cases = [
        {
          'action' : {'type': LOGIN_REQUEST, 'credentials': { 'login': 'TestUser', 'password': 'pass123'}},
          'result' : {
            'isFetching': true,
            'isAuthenticated': false,
            'user': { 'login': 'TestUser', 'password': 'pass123'}
          }
        },
        {
          'action' : {'type': LOGIN_SUCCESS },
          'result' : {
            'isFetching': false,
            'isAuthenticated': true,
            'errorMessage': ''
          }
        },
        {
          'action' : {'type': LOGIN_FAILURE, 'message': 'Some error message' },
          'result' : {
            'isFetching': false,
            'isAuthenticated': false,
            'errorMessage': 'Some error message'
          }
        },
        {
          'action' : {'type': LOGOUT_SUCCESS },
          'result' : {
            'isFetching': true,
            'isAuthenticated': false
          }
        },
        {
          'action' : {'type': 'UNKNOWN_ACTION' },
          'result' : {}
        },
      ];

      cases.forEach((testCase) {
        var action = testCase['action'];
        var expected = testCase['result'];

        test('Should apply reducer: ${action['type']}', () {
          var actual = AuthReducer.reduce({}, action);
          expect(actual, expected);
        });
      });
    });
  }
}

void main() {
  AuthReducerTests.run();
}