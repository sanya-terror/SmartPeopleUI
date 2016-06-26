import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/index.dart';

const SAVE_PASSWORD = 'SAVE_PASSWORD';
const SEND_SIGN_UP_FORM = 'SEND_SIGN_UP_FORM';
const APPLY_CONFIRMATION_CODE = 'APPLY_CONFIRMATION_CODE';
const CLEAR_SIGN_UP = 'CLEAR_SIGN_UP';

class SignUpActionCreator {


   static Action savePassword(String password) => new Action(SAVE_PASSWORD, {'password': password});

   static Action sendSignUpForm(credentials) =>
       ApiActionCreator.postApiAction(SEND_SIGN_UP_FORM, '/handleSignUpForm', {'credentials': credentials}, false);

   static Action applyConfirmationCode(String code) =>
       ApiActionCreator.postApiAction(APPLY_CONFIRMATION_CODE, '/applyConfirmationCode', {'code': code}, false);

   static Action clearSignUp() => new Action(CLEAR_SIGN_UP);
}