import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/actions.dart';

class SignUpData {
  String password;
  String signUpToken;
  bool isConfirmationCodeResent = false;
  int errorCode;

  SignUpData();

  SignUpData.from(SignUpData data) {
    if (data == null) return;

    this.password = data.password;
    this.signUpToken = data.signUpToken;
    this.isConfirmationCodeResent = data.isConfirmationCodeResent;
    this.errorCode = data.errorCode;
  }

  String toString() {
    return '{ password: $password, signUpToken: $signUpToken, isConfirmationCodeResend: $isConfirmationCodeResent, errorCode: $errorCode }';
  }
}

class SignUpReducer {
  static State reduce(State state, Action action) {
    switch (action.type) {
      case SIGN_UP_SAVE_PASSWORD:
        var data = new SignUpData.from(state['signUp'])..password = action.data['password'];
        return new State.from(state)..['signUp'] = data;

      case SIGN_UP_SEND_DATA:
        var data = new SignUpData.from(state['signUp'])
          ..signUpToken = action.data['token']
          ..errorCode = action.data['errorCode'];
        return new State.from(state)..['signUp'] = data;

      case SIGN_UP_RESEND_CONFIRM_CODE:
        var data = new SignUpData.from(state['signUp'])
          ..isConfirmationCodeResent = action.data['errorCode'] == null
          ..errorCode = action.data['errorCode'];
        return new State.from(state)..['signUp'] = data;

      case SIGN_UP_APPLY_CONFIRMATION_CODE:
        var data = new SignUpData.from(state['signUp'])..errorCode = action.data['errorCode'];
        return new State.from(state)..['signUp'] = data;

      case SIGN_UP_CLEAR_DATA:
        return new State.from(state)..remove('signUp');

      default:
        return state;
    }
  }
}
