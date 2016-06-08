import 'package:test/test.dart';
import 'package:SmartPeopleUI/account-management/index.dart';
import 'package:SmartPeopleUI/redux/index.dart';

class RestoreAccessReducerTests {
  static run() {

    group('Restore access reducer', () {

      State initialState;

      setUp((){
        initialState = new State({ 'someProperty': 'some value' });
      });

      List<Map<String, dynamic>> cases = [
        {
          'action': new Action(GET_RESTORE_CODE, { 'codeSent': true}),
          'result': new State({
            'someProperty': 'some value',
            'restoreAccess': new RestoreAccessData(isCodeSent: true)
          })
        },
        {
          'action': new Action(GET_RESTORE_CODE, { 'userNotFound': true}),
          'result': new State({
            'someProperty': 'some value',
            'restoreAccess': new RestoreAccessData(isUserNotFound: true)
          })
        },
        {
          'action': new Action(APPLY_RESTORE_CODE, { 'codeApplied': true}),
          'result': new State({
            'someProperty': 'some value',
            'restoreAccess': new RestoreAccessData(isCodeApplied: true)
          })
        },
        {
          'action': new Action(APPLY_RESTORE_CODE, { 'invalidCode': true}),
          'result': new State({
            'someProperty': 'some value',
            'restoreAccess': new RestoreAccessData(isInvalidCode: true)
          })
        },
        {
          'action': new Action(CLEAR_RESTORE_ACCESS),
          'result': new State({
            'someProperty': 'some value',
            'restoreAccess': null
          })
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
            expect(actualRestoreData.isCodeSent, expectedRestoreAccess.isCodeSent);
            expect(actualRestoreData.isCodeApplied, expectedRestoreAccess.isCodeApplied);
            expect(actualRestoreData.isInvalidCode, expectedRestoreAccess.isInvalidCode);
            expect(actualRestoreData.isUserNotFound, expectedRestoreAccess.isUserNotFound);
          }
        });
      });
    });
  }
}

void main() {
  RestoreAccessReducerTests.run();
}
