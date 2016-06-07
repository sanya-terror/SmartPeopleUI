import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/index.dart';

const GET_RESTORE_CODE = 'GET_RESTORE_CODE';
const APPLY_RESTORE_CODE = 'APPLY_RESTORE_CODE';
const CLEAR_RESTORE_ACCESS = 'CLEAR_RESTORE_ACCESS';

class RestoreAccessActionCreator {
  static Action getRestoreCode(String email) =>
    ApiActionCreator.postApiAction(GET_RESTORE_CODE, '/getCode', {'email': email}, false);

  static Action applyRestoreCode(String code) =>
    ApiActionCreator.postApiAction(APPLY_RESTORE_CODE, '/applyCode', {'code': code}, false);

  static Action clearRestoreAccess() => new Action(CLEAR_RESTORE_ACCESS);
}
