import 'validators/index.dart';
import 'sign-up.action-creator.dart';
import 'sign-up.reducer.dart';

class SignUpTests {
  static run() {
    ValidatorsTests.run();
    SignUpActionCreatorTests.run();
    SignUpReducerTests.run();
  }
}

void main() {
  SignUpTests.run();
}
