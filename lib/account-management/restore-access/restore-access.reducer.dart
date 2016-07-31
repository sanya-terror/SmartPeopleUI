import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/actions.dart';

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

  String toString() {
    return '{ email: $email, isCodeSent: $isCodeSent, changePasswordToken: $changePasswordToken, errorCode: '
        '$errorCode }';
  }
}

class RestoreAccessReducer {
  static State reduce(State state, Action action) {
    switch (action.type) {
      case RESTORE_ACCESS_GET_CODE:
        var data = new RestoreAccessData.from(state['restoreAccess'])
          ..errorCode = action.data['errorCode']
          ..isCodeSent = action.data['errorCode'] == null;
        return new State.from(state)..['restoreAccess'] = data;

      case RESTORE_ACCESS_APPLY_CODE:
        var data = new RestoreAccessData.from(state['restoreAccess'])
          ..changePasswordToken = action.data['token']
          ..errorCode = action.data['errorCode'];
        return new State.from(state)..['restoreAccess'] = data;

      case RESTORE_ACCESS_CHANGE_PASSWORD:
        var data = new RestoreAccessData.from(state['restoreAccess'])..errorCode = action.data['errorCode'];
        return new State.from(state)..['restoreAccess'] = data;

      case RESTORE_ACCESS_CLEAR_DATA:
        return new State.from(state)..remove('restoreAccess');

      default:
        return state;
    }
  }
}
