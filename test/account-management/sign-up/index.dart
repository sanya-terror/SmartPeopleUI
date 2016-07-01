import 'validators/index.dart';
import 'sign-up.action-creator.dart';

class SignUpTests {
  static run() {
    ValidatorsTests.run();
    SignUpActionCreatorTests.run();
  }
}

void main() {
  SignUpTests.run();
}
