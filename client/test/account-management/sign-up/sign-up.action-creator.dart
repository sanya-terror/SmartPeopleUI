import 'package:test/test.dart';

import 'package:smartpeople_client/redux/index.dart';
import 'package:smartpeople_client/index.dart';

class SignUpActionCreatorTests {
  static run() {
    group('Sign up action creator', () {
      test('Should return save password action', () {
        String password = '1q2w3e4r';
        Action result = SignUpActionCreator.savePassword(password);
        expect(result.type, SIGN_UP_SAVE_PASSWORD);
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
        expect(result.type, SIGN_UP_SEND_DATA);
        expect(result.endpoint, '/users/sign-up/create-account');
        expect(result.checkAuthorization, isFalse);
        expect(result.data, {'signUpData': signUpData});
      });

      test('Should return resend confirm code action', () {
        String token = 'some_token';
        ApiAction result = SignUpActionCreator.resendConfirmCode(token);
        expect(result.type, SIGN_UP_RESEND_CONFIRM_CODE);
        expect(result.endpoint, '/users/sign-up/resend-code');
        expect(result.checkAuthorization, isFalse);
        expect(result.data, {'token': token});
      });

      test('Should return apply confirmation code action', () {
        String code = '1q2w3e4r';
        ApiAction result = SignUpActionCreator.applyConfirmationCode(code);
        expect(result.type, SIGN_UP_APPLY_CONFIRMATION_CODE);
        expect(result.endpoint, '/users/sign-up/confirm');
        expect(result.checkAuthorization, isFalse);
        expect(result.data, {'code': code});
      });

      test('Should return clear sign up action', () {
        Action result = SignUpActionCreator.clearSignUp();
        expect(result.type, SIGN_UP_CLEAR_DATA);
        expect(result.data, null);
      });
    });
  }
}

void main() {
  SignUpActionCreatorTests.run();
}
