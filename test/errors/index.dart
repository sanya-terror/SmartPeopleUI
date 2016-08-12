import 'forbidden-error.component.dart';
import 'unauthorized-error.component.dart';
import 'not-found-error.component.dart';
import 'unhandled-error.component.dart';

class ErrorsTests {
  static run() {
    ForbiddenErrorTests.run();
    NotFoundErrorTests.run();
    UnauthorizedErrorTests.run();
    UnhandledErrorTests.run();
  }
}

void main() {
  ErrorsTests.run();
}
