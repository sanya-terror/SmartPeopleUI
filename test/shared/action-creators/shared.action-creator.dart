import 'package:test/test.dart';

import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/index.dart';

class SharedActionCreatorTests {
   static run() {
      group('Shared action', () {
         test('Should return save email action', () {
            String email = 'test@test.com';
            Action result = SharedActionCreator.saveEmail(email);
            expect(result is Action, true);
            expect(result.type, SAVE_EMAIL);
            expect(result.data, {'email': email});
         });

         test('Should return resend confirm code action', () {
            String token = 'some_token';
            ApiAction result = SharedActionCreator.resendConfirmCode(token);
            expect(result is ApiAction, true);
            expect(result.type, RESEND_CONFIRM_CODE);
            expect(result.endpoint, '/resendConfirmCode');
            expect(result.checkAuthorization, isFalse);
            expect(result.data, {'token': token});
         });
      });
   }
}

void main() {
   SharedActionCreatorTests.run();
}
