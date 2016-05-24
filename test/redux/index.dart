import 'store.dart';
import 'applyMiddleware.dart';

class ReduxTests {
  static run() {
    StoreTests.run();
    ApplyMiddlewareTests.run();
  }
}

void main() {
  ReduxTests.run();
}
