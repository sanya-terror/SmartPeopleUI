import 'sign-up/index.dart';
import 'restore-access/index.dart';

class AccountTests{
  static run(){
    SignUpTests.run();
    RestoreAccessTests.run();
  }
}

void main() {
  AccountTests.run();
}