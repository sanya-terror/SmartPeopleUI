import 'authorization.reducer.dart';
import 'authorization.action-creator.dart';

class AuthorizationTests {
  static run() {
    AuthorizationActionCreatorTests.run();
    AuthReducerTests.run();
  }
}

void main() {
  AuthorizationTests.run();
}
