import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/index.dart';

const SAVE_SIGN_UP_PASSWORD = 'SAVE_SIGN_UP_PASSWORD';
const SEND_SIGN_UP_DATA = 'SEND_SIGN_UP_DATA';
const RESEND_CONFIRM_CODE = 'RESEND_CONFIRM_CODE';
const APPLY_SIGN_UP_CONFIRMATION_CODE = 'APPLY_SIGN_UP_CONFIRMATION_CODE';
const CLEAR_SIGN_UP = 'CLEAR_SIGN_UP';

class SignUpActionCreator {

   static Action savePassword(String password) => new Action(SAVE_SIGN_UP_PASSWORD, {'password': password});

   static Action sendSignUpData(signUpData) =>
       ApiActionCreator.postApiAction(SEND_SIGN_UP_DATA, '/handleSignUpData', {'signUpData': signUpData }, false);

   static Action resendConfirmCode(String token) =>
       ApiActionCreator.postApiAction(RESEND_CONFIRM_CODE, '/resendConfirmCode', {'token': token }, false);

   static Action applyConfirmationCode(String code) =>
       ApiActionCreator.postApiAction(APPLY_SIGN_UP_CONFIRMATION_CODE, '/applyConfirmationCode', {'code': code}, false);

   static Action clearSignUp() => new Action(CLEAR_SIGN_UP);
}