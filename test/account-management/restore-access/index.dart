import 'validators/index.dart';
import 'restore-access.reducer.dart';
import 'restore-access.action-creator.dart';

class RestoreAccessTests {
  static run() {
    RestoreCodeValidatorTests.run();
    RestoreAccessReducerTests.run();
    RestoreAccessActionCreatorTests.run();
  }
}

void main() {
  RestoreAccessTests.run();
}
