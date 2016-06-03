import 'package:test/test.dart';
import 'package:SmartPeopleUI/account-management/index.dart';
import 'package:SmartPeopleUI/redux/index.dart';

class AuthReducerTests {
  static run() {
    group('Authorization reducer', () {
      List<Map<String, dynamic>> cases = [
        {
          'action' : new Action(LOGIN_REQUEST, {'credentials': { 'login': 'TestUser', 'password': 'pass123'}}),
          'result' : new State({
            'isFetching': true,
            'isAuthenticated': false,
            'user': { 'login': 'TestUser', 'password': 'pass123'}
          })
        },
        {
          'action' : new Action(LOGIN_SUCCESS, new State({'token': 'some_token'})),
          'result' : new State({
            'isFetching': false,
            'isAuthenticated': true,
            'token': 'some_token',
            'errorMessage': ''
          })
        },
        {
          'action' : new Action(LOGIN_FAILURE, new State({'error': 'Some error message'})),
          'result' : new State({
            'isFetching': false,
            'isAuthenticated': false,
            'errorMessage': 'Some error message'
          })
        },
        {
          'action' : new Action(LOGOUT_SUCCESS),
          'result' : new State({
            'isFetching': true,
            'isAuthenticated': false
          })
        },
        {
          'action' : new Action('UNKNOWN_ACTION'),
          'result' : new State({})
        },
      ];

      cases.forEach((testCase) {
        var action = testCase['action'];
        var expected = testCase['result'];

        test('Should apply reducer: ${action.type}', () {
          var actual = AuthReducer.reduce(State.emptyState, action);
          expect(actual, expected);
        });
      });
    });
  }
}

void main() {
  AuthReducerTests.run();
}