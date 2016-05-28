import 'api.middleware.dart';
import 'api.action-creator.dart';

class MiddlewareTests{
  static run(){
    ApiActionCreatorTests.run();
    ApiMiddlewareTests.run();
  }
}

void main() {
  MiddlewareTests.run();
}