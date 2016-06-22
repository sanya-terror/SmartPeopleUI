import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/account-management/restore-access/index.dart';

class RestoreAccessData {
  bool isCodeSent;
  bool isInvalidCode;
  bool isUserNotFound;
  String changePasswordToken;
  bool isPasswordChanged;
  bool isPasswordChangingError;

  RestoreAccessData({
    this.isCodeSent: false,
    this.isInvalidCode: false,
    this.isUserNotFound: false,
    this.changePasswordToken: null,
    this.isPasswordChanged: false,
    this.isPasswordChangingError: false
  });
}

class RestoreAccessReducer {
  static State reduce(State state, Action action) {
    switch (action.type) {
      case GET_RESTORE_CODE:
        return new State.from(state)
          ..['restoreAccess']= new RestoreAccessData(
            isCodeSent: action.data['codeSent'] == null ? false : action.data['codeSent'],
            isUserNotFound: action.data['userNotFound'] == null ? false : action.data['userNotFound']
          );

      case APPLY_RESTORE_CODE:
        return new State.from(state)
          ..['restoreAccess'] = new RestoreAccessData(
            changePasswordToken: action.data['token'],
            isInvalidCode: action.data['invalidCode'] == null ? false : action.data['invalidCode']);

      case APPLY_PASSWORD_CHANGING:
        return new State.from(state)
          ..['restoreAccess'] = new RestoreAccessData(
              isPasswordChanged: action.data['passwordChanged'] == null ? false : action.data['passwordChanged'],
              isPasswordChangingError: action.data['passwordChangingError'] == null ? false : action.data['passwordChangingError']);

      case CLEAR_RESTORE_ACCESS:
        return new State.from(state)
          ..['restoreAccess'] = null;

      default:
        return state;
    }
  }
}
