import 'shared/index.dart';
import 'account-management/index.dart';
import 'redux/index.dart';
import 'app.component.dart';

void main() {
  AccountManagementTests.run();
  AppComponentTests.run();
  SharedTests.run();
  ReduxTests.run();
}
