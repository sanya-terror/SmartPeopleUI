import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/account-management/restore-access/index.dart';

class RestoreAccessData {
  String email;
  bool isCodeSent = false;
  String changePasswordToken;
  int errorCode;

  RestoreAccessData();

  RestoreAccessData.from(RestoreAccessData data) {
    if (data == null) return;

    this.email = data.email;
    this.isCodeSent = data.isCodeSent;
    this.changePasswordToken = data.changePasswordToken;
    this.errorCode = data.errorCode;
  }
}

class RestoreAccessReducer {
  static State reduce(State state, Action action) {
    switch (action.type) {

      case GET_RESTORE_CODE:
        var data = new RestoreAccessData.from(state['restoreAccess'])
          ..errorCode = action.data['errorCode']
          ..isCodeSent = action.data['errorCode'] == null;
        return new State.from(state)
          ..['restoreAccess'] = data;

      case APPLY_RESTORE_CODE:
        var data = new RestoreAccessData.from(state['restoreAccess'])
          ..changePasswordToken = action.data['token']
          ..errorCode = action.data['errorCode'];
        return new State.from(state)
          ..['restoreAccess'] = data;

      case APPLY_PASSWORD_CHANGING:
        var data = new RestoreAccessData.from(state['restoreAccess'])
          ..errorCode = action.data['errorCode'];
        return new State.from(state)
          ..['restoreAccess'] = data;

      case CLEAR_RESTORE_ACCESS:
        return new State.from(state)
          ..['restoreAccess'] = null;

      default:
        return state;
    }
  }
}