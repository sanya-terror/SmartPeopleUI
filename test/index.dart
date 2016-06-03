import 'shared/index.dart';
import 'account-management/index.dart';
import 'redux/index.dart';

void main() {
  AccountManagementTests.run();
  SharedTests.run();
  ReduxTests.run();
}
