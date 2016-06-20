import 'dart:html';
import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/account-management/restore-access/index.dart';

class RestoreAccessData {
  bool isCodeSent;
  bool isInvalidCode;
  bool isUserNotFound;
  bool changePasswordToken;
  bool passwordChangingError;

  RestoreAccessData({
    this.isCodeSent: false,
    this.isInvalidCode: false,
    this.isUserNotFound: false,
    this.changePasswordToken: null,
    this.passwordChangingError: false
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
        if(action.data['passwordChanged']) {
          window.alert('Password is changed');
          return new State.from(state)
            ..['restoreAccess'] = null;
        }

        return new State.from(state)
          ..['restoreAccess'] = new RestoreAccessData(
              passwordChangingError: action.data['passwordChangingError'] == null ? false : action.data['passwordChangingError']
          );

      case CLEAR_RESTORE_ACCESS:
        return new State.from(state)
          ..['restoreAccess'] = null;

      default:
        return state;
    }
  }
}
