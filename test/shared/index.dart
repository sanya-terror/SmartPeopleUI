import 'validators/index.dart';
import 'middleware/index.dart';
import 'components/index.dart';
import 'action-creators/index.dart';

class SharedTests {
  static run() {
    ActionCreatorsTests.run();
    MiddlewareTests.run();
    ValidatorsTests.run();
    ComponentsTests.run();
  }
}

void main() {
  SharedTests.run();
}
