import 'package:test/test.dart';
import 'package:angular2/common.dart';
import 'package:mockito/mockito.dart';
import 'package:SmartPeopleUI/shared/header/login/login.component.dart';

class MockNgControlName extends Mock implements NgControlName {
  noSuchMethod(i) => super.noSuchMethod(i);
}

@TestOn('browser')
class LoginComponentTests {
  static run() {
    group('Api action', () {
      NgControlName mockControl;
      LoginComponent component = new LoginComponent();

      setUp(() {
        mockControl = spy(new MockNgControlName(), new NgControlName(null, null, null, null));
      });

      var isValidTestCases = [
        { 'untoched': true, 'valid': true, 'result': true},
        { 'untoched': false, 'valid': true, 'result': true},
        { 'untoched': true, 'valid': false, 'result': true},
        { 'untoched': false, 'valid': false, 'result': false}
      ];

      isValidTestCases.forEach((testCase) {
        var untoched = testCase['untoched'];
        var valid = testCase['valid'];
        var result = testCase['result'];

        test('Should check if control is valid. Untoched: $untoched, valid: $valid, result: $result', () {
          when(mockControl.untouched).thenReturn(untoched);
          when(mockControl.valid).thenReturn(valid);
          expect(component.isValid(mockControl), result);
        });
      });

      _mockValid(bool valid){
        when(mockControl.untouched).thenReturn(valid);
        when(mockControl.valid).thenReturn(valid);
      }

      var isRequiredTestCases = [
        { 'valid': true, 'value': 'test', 'result': false},
        { 'valid': true, 'value': '', 'result': false},
        { 'valid': false, 'value': 'test', 'result': false},
        { 'valid': false, 'value': '', 'result': true}
      ];

      isRequiredTestCases.forEach((testCase) {
        var valid = testCase['valid'];
        var value = testCase['value'];
        var result = testCase['result'];

        test('Should check if control is required. Valid: $valid, value: "$value", result: $result',
        () {
          _mockValid(valid);
          when(mockControl.value).thenReturn(value);
          expect(component.isRequired(mockControl), result);
        });
      });
    }

    );
  }
}

void main() {
  LoginComponentTests.run();
}