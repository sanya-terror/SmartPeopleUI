import 'email.validator.dart';
import 'password.validator.dart';
import 'user-name.validator.dart';

class ValidatorsTests {
  static run() {
    EmailValidatorTests.run();
    PasswordValidatorTests.run();
    UserNameValidatorTests.run();
  }
}

void main() {
  ValidatorsTests.run();
}
