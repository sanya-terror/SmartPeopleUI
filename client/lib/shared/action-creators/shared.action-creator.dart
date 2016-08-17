import 'package:smartpeople_client/redux/index.dart';
import 'package:smartpeople_client/shared/index.dart';

class SharedActionCreator {
  static Action saveEmail(String email) => new Action(SAVE_EMAIL, {'email': email});
}
