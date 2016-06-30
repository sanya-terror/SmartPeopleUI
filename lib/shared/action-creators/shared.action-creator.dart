import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/index.dart';

const SAVE_EMAIL = 'SAVE_EMAIL';
const RESEND_CONFIRM_CODE = 'RESEND_CONFIRM_CODE';

class SharedActionCreator {
   static Action saveEmail(String email) => new Action(SAVE_EMAIL, {'email': email});

   static Action resendConfirmCode(bool shouldResendCode) =>
      ApiActionCreator.postApiAction(RESEND_CONFIRM_CODE, '/resendConfirmCode', {'shouldResendCode': shouldResendCode }, false);
}