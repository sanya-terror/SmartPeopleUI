import 'validators/index.dart';
import 'restore-access.reducer.dart';
import 'restore-access.action-creator.dart';
import 'restore-access.component.dart';

class RestoreAccessTests {
  static run() {
    RestoreCodeValidatorTests.run();
    RestoreAccessReducerTests.run();
    RestoreAccessActionCreatorTests.run();
    RestoreAccessComponentTests.run();
  }
}

void main() {
  RestoreAccessTests.run();
}
