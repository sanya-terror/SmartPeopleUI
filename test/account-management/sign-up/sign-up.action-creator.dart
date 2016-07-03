import 'package:test/test.dart';

import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/account-management/sign-up/sign-up.action-creator.dart';
import 'package:SmartPeopleUI/shared/action-creators/index.dart';
import 'package:SmartPeopleUI/account-management/index.dart';

class SignUpActionCreatorTests {
   static run() {
      group('Sign up action creator', () {
         test('Should return save password action', () {
            String password = '1q2w3e4r';
            Action result = SignUpActionCreator.savePassword(password);
            expect(result.type, SAVE_SIGN_UP_PASSWORD);
            expect(result.data, {'password': password});
         });

         test('Should return send sign up action', () {
            Map<String, dynamic> signUpData = {
               'name': 'Aleksander',
               'surname': 'Kabanov',
               'user': 'test@test.com',
               'password': '777777',
               'sex': 'male'
            };
            ApiAction result = SignUpActionCreator.sendSignUpData(signUpData);
            expect(result is ApiAction, true);
            expect(result.type, SEND_SIGN_UP_DATA);
            expect(result.endpoint, '/handleSignUpData');
            expect(result.checkAuthorization, isFalse);
            expect(result.data, {'signUpData': signUpData});
         });

         test('Should return resend confirm code action', () {
            String token = 'some_token';
            ApiAction result = SignUpActionCreator.resendConfirmCode(token);
            expect(result is ApiAction, true);
            expect(result.type, RESEND_CONFIRM_CODE);
            expect(result.endpoint, '/resendConfirmCode');
            expect(result.checkAuthorization, isFalse);
            expect(result.data, {'token': token});
         });

         test('Should return apply confirmation code action', () {
            String code = '1q2w3e4r';
            ApiAction result = SignUpActionCreator.applyConfirmationCode(code);
            expect(result is ApiAction, true);
            expect(result.type, APPLY_SIGN_UP_CONFIRMATION_CODE);
            expect(result.endpoint, '/applyConfirmationCode');
            expect(result.checkAuthorization, isFalse);
            expect(result.data, {'code': code});
         });

         test('Should return clear sign up action', () {
            Action result = SignUpActionCreator.clearSignUp();
            expect(result.type, CLEAR_SIGN_UP);
            expect(result.data, null);
         });
      });
   }
}

void main() {
   SignUpActionCreatorTests.run();
}