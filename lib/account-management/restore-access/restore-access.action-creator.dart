import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/index.dart';

class RestoreAccessActionCreator {
  static Action getRestoreCode(String email) =>
      ApiActionCreator.postApiAction(RESTORE_ACCESS_GET_CODE, '/users/restore-access/send-code', {'email': email}, false);

  static Action applyRestoreCode(String code) =>
      ApiActionCreator.postApiAction(RESTORE_ACCESS_APPLY_CODE, '/users/restore-access/apply-code', {'code': code}, false);

  static Action applyPasswordChanging(String password, String token) {
    return ApiActionCreator.postApiAction(
        RESTORE_ACCESS_CHANGE_PASSWORD, '/users/restore-access/change-password', {'password': password, 'token': token}, false);
  }

  static Action clearRestoreAccess() => new Action(RESTORE_ACCESS_CLEAR_DATA);
}
