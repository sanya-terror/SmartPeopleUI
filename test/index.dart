import 'shared/index.dart';
import 'account/index.dart';
import 'redux/index.dart';

void main() {
  AccountTests.run();
  SharedTests.run();
  ReduxTests.run();
}