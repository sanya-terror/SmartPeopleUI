import 'api.action-creator.dart';
import 'shared.action-creator.dart';

class ActionCreatorsTests {
  static run() {
    ApiActionCreatorTests.run();
    SharedActionCreatorTests.run();
  }
}

void main() {
  ActionCreatorsTests.run();
}
