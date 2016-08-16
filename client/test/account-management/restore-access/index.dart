import 'validators/index.dart';
import 'restore-access.reducer.dart';
import 'restore-access.action-creator.dart';
import 'restore-access.component.dart';
import 'restore-access-code.component.dart';
import 'restore-access-email.component.dart';
import 'change-password.component.dart';

class RestoreAccessTests {
  static run() {
    RestoreCodeValidatorTests.run();
    RestoreAccessReducerTests.run();
    RestoreAccessActionCreatorTests.run();
    RestoreAccessComponentTests.run();
    RestoreAccessCodeComponentTests.run();
    RestoreAccessEmailComponentTests.run();
    ChangePasswordComponentTests.run();
  }
}

void main() {
  RestoreAccessTests.run();
}
