import 'package:test/test.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/index.dart';

class AuthReducerTests {
  static run() {
    group('Authorization reducer', () {
      List<Map<String, dynamic>> cases = [
        {
          'action': new Action(LOGIN_REQUEST, {
            'credentials': {'user': 'TestUser', 'password': 'pass123'}
          }),
          'result': new State({
            'isFetching': true,
            'isAuthenticated': false,
            'userData': {'user': 'TestUser', 'password': 'pass123'}
          })
        },
        {
          'action': new Action(LOGIN_SUCCESS),
          'result': new State({'isFetching': false, 'isAuthenticated': true, 'errorCode': null})
        },
        {
          'action': new Action(LOGIN_FAILURE, new State({'errorCode': 7777})),
          'result': new State({'isFetching': false, 'isAuthenticated': false, 'errorCode': 7777})
        },
        {
          'action': new Action(LOGOUT_SUCCESS),
          'result': new State({'isFetching': true, 'isAuthenticated': false})
        },
        {'action': new Action('UNKNOWN_ACTION'), 'result': new State({})},
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
