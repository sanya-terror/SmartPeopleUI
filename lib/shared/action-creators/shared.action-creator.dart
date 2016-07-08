import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/index.dart';

class SharedActionCreator {
   static Action saveEmail(String email) => new Action(SAVE_EMAIL, {'email': email});
}