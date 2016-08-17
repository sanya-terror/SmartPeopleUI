import 'api-errors.reducer.dart';
import 'shared.reducer.dart';

class ReducersTests {
  static run() {
    ApiErrorsReducerTests.run();
    SharedReducerTests.run();
  }
}

void main() {
  ReducersTests.run();
}
