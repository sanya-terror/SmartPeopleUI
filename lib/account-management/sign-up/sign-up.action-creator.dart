import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/index.dart';

const SAVE_SIGN_UP_PASSWORD = 'SAVE_SIGN_UP_PASSWORD';
const SEND_SIGN_UP_FORM = 'SEND_SIGN_UP_FORM';
const APPLY_SIGN_UP_CONFIRMATION_CODE = 'APPLY_SIGN_UP_CONFIRMATION_CODE';
const CLEAR_SIGN_UP = 'CLEAR_SIGN_UP';

class SignUpActionCreator {


   static Action savePassword(String password) => new Action(SAVE_SIGN_UP_PASSWORD, {'password': password});

   static Action sendSignUpForm(sendSignUpData) =>
       ApiActionCreator.postApiAction(SEND_SIGN_UP_FORM, '/handleSignUpForm', {'sendSignUpData ': sendSignUpData }, false);

   static Action applyConfirmationCode(String code) =>
       ApiActionCreator.postApiAction(APPLY_SIGN_UP_CONFIRMATION_CODE, '/applyConfirmationCode', {'code': code}, false);

   static Action clearSignUp() => new Action(CLEAR_SIGN_UP);
}