import 'unauthorized-error.component.dart';
import 'not-found-error.component.dart';

class ErrorsTests {
   static run() {
      NotFoundErrorTests.run();
      UnauthorizedErrorTests.run();
   }
}

void main() {
   ErrorsTests.run();
}
