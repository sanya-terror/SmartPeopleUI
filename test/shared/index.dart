import 'validators/index.dart';
import 'authorization/index.dart';
import 'middleware/index.dart';
import 'form.component.dart';
import 'header/index.dart';

class SharedTests{
  static run(){
    AuthorizationTests.run();
    MiddlewareTests.run();
    ValidatorsTests.run();
    HeaderTests.run();
    FormComponentTests.run();
  }
}

void main() {
  SharedTests.run();
}