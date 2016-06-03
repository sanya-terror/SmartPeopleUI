import 'email.validator.dart';
import 'password.validator.dart';

class ValidatorsTests {
  static run() {
    EmailValidatorTests.run();
    PasswordValidatorTests.run();
  }
}

void main() {
  ValidatorsTests.run();
}
