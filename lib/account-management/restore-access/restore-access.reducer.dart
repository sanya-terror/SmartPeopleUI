import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/account-management/restore-access/index.dart';

class RestoreAccessData {
  String email;
  bool isCodeSent;
  bool isInvalidCode;
  bool isUserNotFound;
  String changePasswordToken;
  bool isPasswordChanged;
  bool isPasswordChangingError;

  RestoreAccessData({
    this.email: null,
    this.isCodeSent: false,
    this.isInvalidCode: false,
    this.isUserNotFound: false,
    this.changePasswordToken: null,
    this.isPasswordChanged: false,
    this.isPasswordChangingError: false
  });

  RestoreAccessData.from(RestoreAccessData data) {
    this.email = data?.email;
    this.isCodeSent = data?.isCodeSent;
    this.isInvalidCode = data?.isInvalidCode;
    this.isUserNotFound = data?.isUserNotFound;
    this.changePasswordToken = data?.changePasswordToken;
    this.isPasswordChanged = data?.isPasswordChanged;
    this.isPasswordChangingError = data?.isPasswordChangingError;
  }
}

class RestoreAccessReducer {
  static State reduce(State state, Action action) {
    switch (action.type) {

      case GET_RESTORE_CODE:
        RestoreAccessData data = new RestoreAccessData.from(state['restoreAccess'])
          ..isCodeSent = action.data['codeSent'] == null ? false : action.data['codeSent']
          ..email = action.data['email']
          ..isUserNotFound =  action.data['userNotFound'] == null ? false : action.data['userNotFound'];
        return new State.from(state)
          ..['restoreAccess'] = data;

      case APPLY_RESTORE_CODE:
        RestoreAccessData data = new RestoreAccessData.from(state['restoreAccess'])
          ..changePasswordToken = action.data['token']
          ..isInvalidCode = action.data['invalidCode'] == null ? false : action.data['invalidCode'];
        return new State.from(state)
          ..['restoreAccess'] = data;

      case APPLY_PASSWORD_CHANGING:
        RestoreAccessData data = new RestoreAccessData.from(state['restoreAccess'])
          ..isPasswordChanged = action.data['passwordChanged'] == null ? false : action.data['passwordChanged']
          ..isPasswordChangingError = action.data['passwordChangingError'] == null ? false : action.data['passwordChangingError'];
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
