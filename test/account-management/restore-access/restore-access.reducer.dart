import 'package:test/test.dart';
import 'package:SmartPeopleUI/account-management/index.dart';
import 'package:SmartPeopleUI/redux/index.dart';

class RestoreAccessReducerTests {
   static run() {
      group('Restore access reducer', () {
         State initialState;

         setUp(() {
            initialState = new State({ 'someProperty': 'some value'});
         });

         List<Map<String, dynamic>> cases = [
            {
               'action': new Action(GET_RESTORE_CODE, { 'errorCode': 1111}),
               'result': new State({
                  'someProperty': 'some value',
                  'restoreAccess': new RestoreAccessData()
                     ..errorCode = 1111
                     ..isCodeSent = false
               })
            },
            {
               'action': new Action(GET_RESTORE_CODE, { }),
               'result': new State({
                  'someProperty': 'some value',
                  'restoreAccess': new RestoreAccessData()
                     ..errorCode = null
                     ..isCodeSent = true
               })
            },
            {
               'action': new Action(SAVE_EMAIL, { 'email': 'some@email.com'}),
               'result': new State({
                  'someProperty': 'some value',
                  'restoreAccess': new RestoreAccessData()
                     ..email = 'some@email.com'
               })
            },
            {
               'action': new Action(APPLY_RESTORE_CODE, { 'token': 'some_token'}),
               'result': new State({
                  'someProperty': 'some value',
                  'restoreAccess': new RestoreAccessData()
                     ..changePasswordToken = 'some_token'
                     ..errorCode = null
               })
            },
            {
               'action': new Action(APPLY_RESTORE_CODE, { 'errorCode': 2222 }),
               'result': new State({
                  'someProperty': 'some value',
                  'restoreAccess': new RestoreAccessData()
                     ..errorCode = 2222
                     ..changePasswordToken = null
               })
            },
            {
               'action': new Action(APPLY_PASSWORD_CHANGING, { }),
               'result': new State({
                  'someProperty': 'some value',
                  'restoreAccess': new RestoreAccessData()
                     ..errorCode = null
               })
            },
            {
               'action': new Action(APPLY_PASSWORD_CHANGING, { 'errorCode': 1234}),
               'result': new State({
                  'someProperty': 'some value',
                  'restoreAccess': new RestoreAccessData()
                     ..errorCode = 1234
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
