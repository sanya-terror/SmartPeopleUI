import 'package:smartpeople_client/redux/index.dart' show Action;

import 'package:smartpeople_client/shared/index.dart'
    show
        ApiActionCreator,
        SIGN_UP_APPLY_CONFIRMATION_CODE,
        SIGN_UP_SAVE_PASSWORD,
        SIGN_UP_SEND_DATA,
        SIGN_UP_RESEND_CONFIRM_CODE,
        SIGN_UP_CLEAR_DATA;

class SignUpActionCreator {
  static Action savePassword(String password) => new Action(SIGN_UP_SAVE_PASSWORD, {'password': password});

  static Action sendSignUpData(signUpData) => ApiActionCreator.postApiAction(
      SIGN_UP_SEND_DATA, '/users/sign-up/create-account', {'signUpData': signUpData}, false);

  static Action resendConfirmCode(String token) => ApiActionCreator.postApiAction(
      SIGN_UP_RESEND_CONFIRM_CODE, '/users/sign-up/resend-code', {'token': token}, false);

  static Action applyConfirmationCode(String code) =>
      ApiActionCreator.postApiAction(SIGN_UP_APPLY_CONFIRMATION_CODE, '/users/sign-up/confirm', {'code': code}, false);

  static Action clearSignUp() => new Action(SIGN_UP_CLEAR_DATA);
}
