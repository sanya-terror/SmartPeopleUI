import 'store.dart';
import 'middleware.dart';
import 'reducer.dart';

class ReduxTests {
  static run() {
    ReducerTests.run();
    StoreTests.run();
    ApplyMiddlewareTests.run();
  }
}

void main() {
  ReduxTests.run();
}
