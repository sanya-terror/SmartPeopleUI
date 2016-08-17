import 'package:test/test.dart';
import 'package:smartpeople_client/redux/index.dart';
import 'package:smartpeople_client/index.dart';

class RestoreAccessReducerTests {
  static run() {
    group('Restore access reducer', () {
      State initialState;

      setUp(() {
        initialState = new State({'someProperty': 'some value'});
      });

      List<Map<String, dynamic>> cases = [
        {
          'action': new Action(RESTORE_ACCESS_GET_CODE, {'errorCode': 1111}),
          'result': new State({
            'someProperty': 'some value',
            'restoreAccess': new RestoreAccessData()
              ..errorCode = 1111
              ..isCodeSent = false
          })
        },
        {
          'action': new Action(RESTORE_ACCESS_GET_CODE, {}),
          'result': new State({
            'someProperty': 'some value',
            'restoreAccess': new RestoreAccessData()
              ..errorCode = null
              ..isCodeSent = true
          })
        },
        {
          'action': new Action(RESTORE_ACCESS_APPLY_CODE, {'token': 'some_token'}),
          'result': new State({
            'someProperty': 'some value',
            'restoreAccess': new RestoreAccessData()
              ..changePasswordToken = 'some_token'
              ..errorCode = null
          })
        },
        {
          'action': new Action(RESTORE_ACCESS_APPLY_CODE, {'errorCode': 2222}),
          'result': new State({
            'someProperty': 'some value',
            'restoreAccess': new RestoreAccessData()
              ..errorCode = 2222
              ..changePasswordToken = null
          })
        },
        {
          'action': new Action(RESTORE_ACCESS_CHANGE_PASSWORD, {}),
          'result':
              new State({'someProperty': 'some value', 'restoreAccess': new RestoreAccessData()..errorCode = null})
        },
        {
          'action': new Action(RESTORE_ACCESS_CHANGE_PASSWORD, {'errorCode': 1234}),
          'result':
              new State({'someProperty': 'some value', 'restoreAccess': new RestoreAccessData()..errorCode = 1234})
        },
        {
          'action': new Action(RESTORE_ACCESS_CLEAR_DATA),
          'result': new State({'someProperty': 'some value'})
        }
      ];

      cases.forEach((testCase) {
        var action = testCase['action'];
        var expected = testCase['result'];

        test('Should apply reducer: ${action.type}', () {
          var actual = RestoreAccessReducer.reduce(initialState, action);
          expect(actual['someProperty'], expected['someProperty']);

          RestoreAccessData expectedRestoreAccess = expected['restoreAccess'];
          RestoreAccessData actualRestoreData = actual['restoreAccess'];

          if (expectedRestoreAccess == null) {
            expect(actualRestoreData, null);
          } else {
            expect(actualRestoreData.email, expectedRestoreAccess.email);
            expect(actualRestoreData.isCodeSent, expectedRestoreAccess.isCodeSent);
            expect(actualRestoreData.changePasswordToken, expectedRestoreAccess.changePasswordToken);
            expect(actualRestoreData.errorCode, expectedRestoreAccess.errorCode);
          }
        });
      });
    });
  }
}

void main() {
  RestoreAccessReducerTests.run();
}
