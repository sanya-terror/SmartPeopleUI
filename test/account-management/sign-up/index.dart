import 'validators/index.dart';
import 'sign-up.action-creator.dart';
import 'sign-up.reducer.dart';
import 'sign-up.component.dart';
import 'sign-up-form.component.dart';

class SignUpTests {
  static run() {
    ValidatorsTests.run();
    SignUpActionCreatorTests.run();
    SignUpReducerTests.run();
    SignUpComponentTests.run();
    SignUpFormComponentTests.run();
  }
}

void main() {
  SignUpTests.run();
}
