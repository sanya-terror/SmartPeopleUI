import 'package:test/test.dart';
import 'package:angular2/common.dart';
import 'package:mockito/mockito.dart';
import 'package:SmartPeopleUI/shared/header/login/login.component.dart';

class MockNgControlName extends Mock implements NgControlName {
  noSuchMethod(i) => super.noSuchMethod(i);
}

class LoginComponentTests {
  static run() {
    group('Login component', () {
      NgControlName mockControl;
      LoginComponent component = new LoginComponent();

      setUp(() {
        mockControl = spy(new MockNgControlName(), new NgControlName(null, null, null, null));
      });
    });
  }
}

void main() {
  LoginComponentTests.run();
}