import 'email.validator.dart';
import 'password.validator.dart';
import 'name.validator.dart';

class Validators{
  static run(){
    EmailValidatorTests.run();
    PasswordValidatorTests.run();
    NameValidatorTests.run();
  }
}

void main() {
  Validators.run();
}