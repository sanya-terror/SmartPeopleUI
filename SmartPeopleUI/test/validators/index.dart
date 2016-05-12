import 'email.validator.dart';
import 'password.validator.dart';

class Validators{
  static run(){
    EmailValidatorTests.run();
    PasswordValidatorTests.run();
  }
}

void main() {
  Validators.run();
}