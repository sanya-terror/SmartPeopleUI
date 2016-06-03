import 'package:test/test.dart';
import 'package:angular2/common.dart';
import 'package:mockito/mockito.dart';
import 'package:SmartPeopleUI/account-management/login/index.dart';

class MockNgControlName extends Mock implements NgControlName {
  noSuchMethod(i) => super.noSuchMethod(i);
}

class LoginComponentTests {
  static run() {
    group('Login component', () {
      NgControlName mockControl;

      setUp(() {
        mockControl = spy(
            new MockNgControlName(), new NgControlName(null, null, null, null));
      });
    });
  }
}

void main() {
  LoginComponentTests.run();
}
