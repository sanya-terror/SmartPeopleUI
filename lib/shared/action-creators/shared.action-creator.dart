import 'package:SmartPeopleUI/redux/index.dart';

const SAVE_EMAIL = 'SAVE_EMAIL';

class SharedActionCreator {
   static Action saveEmail(String email) => new Action(SAVE_EMAIL, {'email': email});
}