import 'email.validator.dart';
import 'password.validator.dart';
import 'name.validator.dart';
import 'restore-code.validator.dart';


class Validators{
  static run(){
    EmailValidatorTests.run();
    PasswordValidatorTests.run();
    NameValidatorTests.run();
    RestoreCodeValidatorTests.run();
  }
}

void main() {
  Validators.run();
}