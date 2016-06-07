import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/account-management/restore-access/index.dart';

class RestoreAccessReducer {
  static State reduce(State state, Action action) {
    switch (action.type) {
      case GET_RESTORE_CODE:
        return new State.from(state)
          ..['restoreAccess']= {
            'codeSent': action.data['codeSent'],
            'userNotFound' : action.data['userNotFound']
          };

      case CLEAR_RESTORE_ACCESS:
        return new State.from(state)
          ..['restoreAccess']= null;

      case APPLY_RESTORE_CODE:
        return new State.from(state)
          ..['restoreAccess'] = {
            'codeSent': false,
            'userNotFound' : false,
            'codeApplied' : action.data['codeApplied'],
            'invalidCode' : action.data['invalidCode']
          };
      default:
        return state;
    }
  }
}
