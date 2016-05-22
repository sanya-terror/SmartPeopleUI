import 'validators/index.dart';
import 'authorization/index.dart';

class SharedTests{
  static run(){
    AuthorizationTests.run();
    ValidatorsTests.run();
  }
}

void main() {
  SharedTests.run();
}