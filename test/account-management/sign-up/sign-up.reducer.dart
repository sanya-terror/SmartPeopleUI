import 'package:test/test.dart';
import 'package:SmartPeopleUI/account-management/index.dart';
import 'package:SmartPeopleUI/redux/index.dart';

class SignUpReducerTests {
   static run() {
      group('Sign up reducer', () {
         State initialState;

         setUp(() {
            initialState = new State({ 'someProperty': 'some value'});
         });

         List<Map<String, dynamic>> cases = [
            {
               'action': new Action(SAVE_SIGN_UP_PASSWORD, { 'password': '1q2w3e4r'}),
               'result': new State({
                  'someProperty': 'some value',
                  'signUp': new SignUpData()
                     ..password = '1q2w3e4r'
               })
            },
            {
               'action': new Action(SEND_SIGN_UP_DATA, { 'token': 'some_token'}),
               'result': new State({
                  'someProperty': 'some value',
                  'signUp': new SignUpData()
                     ..signUpToken = 'some_token'
                     ..errorCode = null
               })
            },
            {
               'action':new Action(RESEND_CONFIRM_CODE, {'errorCode': null}),
               'result': new State({
                  'someProperty': 'some value',
                  'signUp': new SignUpData()
                     ..isConfirmationCodeResend = true
                     ..errorCode = null
               })
            },
            {
               'action':new Action(RESEND_CONFIRM_CODE, {'errorCode': 5555}),
               'result': new State({
                  'someProperty': 'some value',
                  'signUp': new SignUpData()
                     ..isConfirmationCodeResend = false
                     ..errorCode = 5555
               })
            },
            {
               'action': new Action(SEND_SIGN_UP_DATA, { 'errorCode': 3333 }),
               'result': new State({
                  'someProperty': 'some value',
                  'signUp': new SignUpData()
                     ..errorCode = 3333
                     ..signUpToken = null
               })
            },
            {
               'action': new Action(APPLY_SIGN_UP_CONFIRMATION_CODE, { }),
               'result': new State({
                  'someProperty': 'some value',
                  'signUp': new SignUpData()
                     ..errorCode = null
               })
            },
            {
               'action': new Action(APPLY_SIGN_UP_CONFIRMATION_CODE, { 'errorCode': 5555}),
               'result': new State({
                  'someProperty': 'some value',
                  'signUp': new SignUpData()
                     ..errorCode = 5555
               })
            },
            {
               'action': new Action(CLEAR_SIGN_UP),
               'result': new State({
                  'someProperty': 'some value'
               })
            }
         ];

         cases.forEach((testCase) {
            var action = testCase['action'];
            var expected = testCase['result'];

            test('Should apply reducer: ${action.type}', () {
               var actual = SignUpReducer.reduce(initialState, action);
               expect(actual['someProperty'], expected['someProperty']);

               SignUpData expectedSignUp = expected['signUp'];
               SignUpData actualSignUpData = actual['signUp'];

               if (expectedSignUp == null) {
                  expect(actualSignUpData, null);
               } else {
                  expect(actualSignUpData.password, expectedSignUp.password);
                  expect(actualSignUpData.signUpToken, expectedSignUp.signUpToken);
                  expect(actualSignUpData.isConfirmationCodeResend, expectedSignUp.isConfirmationCodeResend);
                  expect(actualSignUpData.errorCode, expectedSignUp.errorCode);
               }
            });
         });
      });
   }
}

void main() {
   SignUpReducerTests.run();
}
