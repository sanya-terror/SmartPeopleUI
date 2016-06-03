import 'sign-up/index.dart';
import 'restore-access/index.dart';
import 'login/index.dart';
import 'auth.action-creator.dart';
import 'auth.reducer.dart';

class AccountManagementTests {
  static run() {
    SignUpTests.run();
    RestoreAccessTests.run();
    LoginTests.run();
    AuthorizationActionCreatorTests.run();
    AuthReducerTests.run();
  }
}

void main() {
  AccountManagementTests.run();
}
