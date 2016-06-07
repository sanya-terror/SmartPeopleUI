import 'package:test/test.dart';

import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/account-management/restore-access/restore-access.action-creator.dart';
import 'package:SmartPeopleUI/shared/action-creators/index.dart';

class RestoreAccessActionCreatorTests {
  static run() {
    group('Restore access action creator', () {
      test('Should return get code action', () {
        var email = 'test@test.test';
        ApiAction result = RestoreAccessActionCreator.getRestoreCode(email);
        expect(result is ApiAction, true);
        expect(result.type, GET_RESTORE_CODE);
        expect(result.endpoint, '/getCode');
        expect(result.checkAuthorization, isFalse);
        expect(result.data, {'email': email});
      });

      test('Should return apply code action', () {
        var code = '123QWERTY';
        ApiAction result = RestoreAccessActionCreator.applyRestoreCode(code);
        expect(result is ApiAction, true);
        expect(result.type, APPLY_RESTORE_CODE);
        expect(result.endpoint, '/applyCode');
        expect(result.checkAuthorization, isFalse);
        expect(result.data, {'code': code});
      });

      test('Should return clear restore access action', () {
        Action result = RestoreAccessActionCreator.clearRestoreAccess();
        expect(result.type, CLEAR_RESTORE_ACCESS);
        expect(result.data, null);
      });
    });
  }
}

void main() {
  RestoreAccessActionCreatorTests.run();
}
