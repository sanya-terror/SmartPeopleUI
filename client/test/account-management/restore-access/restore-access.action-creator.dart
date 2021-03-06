import 'package:test/test.dart';

import 'package:smartpeople_client/redux/index.dart';
import 'package:smartpeople_client/account-management/restore-access/restore-access.action-creator.dart';
import 'package:smartpeople_client/shared/index.dart';

class RestoreAccessActionCreatorTests {
  static run() {
    group('Restore access action creator', () {
      test('Should return get code action', () {
        var email = 'test@test.test';
        ApiAction result = RestoreAccessActionCreator.getRestoreCode(email);
        expect(result.type, RESTORE_ACCESS_GET_CODE);
        expect(result.endpoint, '/users/restore-access/send-code');
        expect(result.checkAuthorization, isFalse);
        expect(result.data, {'email': email});
      });

      test('Should return apply code action', () {
        var code = '123QWERTY';
        ApiAction result = RestoreAccessActionCreator.applyRestoreCode(code);
        expect(result.type, RESTORE_ACCESS_APPLY_CODE);
        expect(result.endpoint, '/users/restore-access/apply-code');
        expect(result.checkAuthorization, isFalse);
        expect(result.data, {'code': code});
      });

      test('Should return apply password changing action', () {
        var password = 'qwerty123';
        var token = 'password_changing_token';
        ApiAction result = RestoreAccessActionCreator.applyPasswordChanging(password, token);
        expect(result.type, RESTORE_ACCESS_CHANGE_PASSWORD);
        expect(result.endpoint, '/users/restore-access/change-password');
        expect(result.checkAuthorization, isFalse);
        expect(result.data, {'password': password, 'token': token});
      });

      test('Should return clear restore access action', () {
        Action result = RestoreAccessActionCreator.clearRestoreAccess();
        expect(result.type, RESTORE_ACCESS_CLEAR_DATA);
        expect(result.data, null);
      });
    });
  }
}

void main() {
  RestoreAccessActionCreatorTests.run();
}
