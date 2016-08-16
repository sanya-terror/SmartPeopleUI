import 'package:test/test.dart';
import 'package:angular2/common.dart';
import 'package:mockito/mockito.dart';
import 'package:smartpeople_client/shared/components/form.component.dart';

class MockControl extends Mock implements Control {
  noSuchMethod(i) => super.noSuchMethod(i);
}

class FormComponentTests {
  static run() {
    group('Form component', () {
      Control mockControl;
      Control mockControlToCompare;
      FormComponent component = new FormComponent();

      setUp(() {
        mockControl = spy(new MockControl(), new Control(''));
      });

      _mockValid(bool valid) {
        when(mockControl.untouched).thenReturn(valid);
        when(mockControl.valid).thenReturn(valid);
      }

      _getRequiredError(bool required) {
        return required ? {'required': true} : {};
      }

      _getMinLengthError(bool minLength) {
        return minLength ? {'minlength': true} : {};
      }

      _getMaxLengthError(bool maxLength) {
        return maxLength ? {'maxlength': true} : {};
      }

      group('Is control valid', () {
        var isValidTestCases = [
          {'untouched': false, 'valid': false, 'result': false},
          {'untouched': false, 'valid': true, 'result': true},
          {'untouched': true, 'valid': false, 'result': true},
          {'untouched': true, 'valid': true, 'result': true},
        ];

        isValidTestCases.forEach((testCase) {
          bool untouched = testCase['untouched'];
          bool valid = testCase['valid'];
          bool result = testCase['result'];

          test('Should check if control is valid. Untoched: $untouched, valid: $valid, result: $result', () {
            when(mockControl.untouched).thenReturn(untouched);
            when(mockControl.valid).thenReturn(valid);
            expect(component.isValid(mockControl), result);
          });
        });
      });

      group('Is control required', () {
        var isRequiredTestCases = [
          {'invalid': false, 'required': false, 'result': false},
          {'invalid': false, 'required': true, 'result': false},
          {'invalid': true, 'required': false, 'result': false},
          {'invalid': true, 'required': true, 'result': true}
        ];

        isRequiredTestCases.forEach((testCase) {
          bool invalid = testCase['invalid'];
          bool required = testCase['required'];
          bool result = testCase['result'];
          bool valid = !invalid;

          test('Should check if control is required. Invalid: $invalid, required: $required, result: $result', () {
            _mockValid(valid);
            when(mockControl.errors).thenReturn(required ? {'required': true} : {});

            expect(component.isRequired(mockControl), result);
          });
        });
      });

      group('Is control length correct', () {
        var isInsufficientLengthTestCases = [
          {'invalid': false, 'minlength': false, 'result': false},
          {'invalid': false, 'minlength': true, 'result': false},
          {'invalid': true, 'minlength': false, 'result': false},
          {'invalid': true, 'minlength': true, 'result': true}
        ];

        isInsufficientLengthTestCases.forEach((testCase) {
          bool invalid = testCase['invalid'];
          bool minLength = testCase['minlength'];
          bool result = testCase['result'];
          bool valid = !invalid;

          test(
              'Should check if control length is insufficient. Invalid: $invalid, minlength: $minLength, result: $result',
              () {
            _mockValid(valid);
            when(mockControl.errors).thenReturn(minLength ? {'minlength': true} : {});

            expect(component.isInsufficientLength(mockControl), result);
          });
        });

        var isLengthExcessTestCases = [
          {'invalid': false, 'maxlength': false, 'result': false},
          {'invalid': false, 'maxlength': true, 'result': false},
          {'invalid': true, 'maxlength': false, 'result': false},
          {'invalid': true, 'maxlength': true, 'result': true}
        ];

        isLengthExcessTestCases.forEach((testCase) {
          bool invalid = testCase['invalid'];
          bool maxLength = testCase['maxlength'];
          bool result = testCase['result'];
          bool valid = !invalid;

          test('Should check if control length is excess. Invalid: $invalid, maxlength: $maxLength, result: $result',
              () {
            _mockValid(valid);
            when(mockControl.errors).thenReturn(maxLength ? {'maxlength': true} : {});

            expect(component.isLengthExcess(mockControl), result);
          });
        });
      });

      group('Does control have non-reequired error', () {
        var hasRequiredErrorTestCases = [
          {'valid': false, 'required': false, 'result': false},
          {'valid': false, 'required': true, 'result': true},
          {'valid': true, 'required': false, 'result': true},
          {'valid': true, 'required': true, 'result': true}
        ];

        hasRequiredErrorTestCases.forEach((testCase) {
          bool valid = testCase['valid'];
          bool required = testCase['required'];
          bool result = testCase['result'];

          test('Should check if non required error. Valid: $valid, required: $required, result: $result', () {
            _mockValid(valid);

            var errors = _getRequiredError(required);
            when(mockControl.errors).thenReturn(errors);

            expect(component.hasRequiredError(mockControl), result);
          });
        });
      });

      group('Does control have non-range error', () {
        var hasRangeErrorTestCases = [
          {'valid': false, 'required': false, 'minlength': false, 'maxlength': false, 'result': false},
          {'valid': false, 'required': false, 'minlength': false, 'maxlength': true, 'result': true},
          {'valid': false, 'required': false, 'minlength': true, 'maxlength': false, 'result': true},
          {'valid': false, 'required': true, 'minlength': false, 'maxlength': false, 'result': true},
          {'valid': true, 'required': false, 'minlength': false, 'maxlength': false, 'result': true}
        ];

        hasRangeErrorTestCases.forEach((testCase) {
          bool valid = testCase['valid'];
          bool required = testCase['required'];
          bool minlength = testCase['minlength'];
          bool maxlength = testCase['maxlength'];
          bool result = testCase['result'];

          test(
              'Should check if non-range error. '
              'Valid: $valid, required: $required, minlength: $minlength, maxlength: $maxlength, result: $result', () {
            _mockValid(valid);

            var errors = {}
              ..addAll(_getRequiredError(required))
              ..addAll(_getMinLengthError(minlength))
              ..addAll(_getMaxLengthError(maxlength));

            when(mockControl.errors).thenReturn(errors);

            expect(component.hasRangeError(mockControl), result);
          });
        });
      });

      group('Are controls equal each other', () {
        setUp(() {
          mockControlToCompare = spy(new MockControl(), new NgControlName(null, null, null, null));
        });

        var isEqualTestCases = [
          {'value1': 'match', 'value2': 'match', 'result': true},
          {'value1': 'match', 'value2': 'mismatch', 'result': false}
        ];

        isEqualTestCases.forEach((testCase) {
          String value1 = testCase['value1'];
          String value2 = testCase['value2'];
          bool result = testCase['result'];

          test('Should check whether the controls are equal. Value1: $value1, value2: $value2, $result', () {
            when(mockControl.value).thenReturn(value1);
            when(mockControlToCompare.value).thenReturn(value2);

            expect(component.isEqual(mockControl, mockControlToCompare), result);
          });
        });
      });
    });
  }
}

void main() {
  FormComponentTests.run();
}
