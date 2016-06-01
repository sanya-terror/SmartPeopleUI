import 'package:test/test.dart';
import 'package:angular2/common.dart';
import 'package:mockito/mockito.dart';
import 'package:SmartPeopleUI/shared/form.component.dart';

class MockNgControlName extends Mock implements NgControlName {
   noSuchMethod(i) => super.noSuchMethod(i);
}

class FormComponentTests {
   static run() {
      group('Form component', () {
         NgControlName mockControl;
         FormComponent component = new FormComponent();

         setUp(() {
            mockControl = spy(new MockNgControlName(),
                new NgControlName(null, null, null, null));
         });

         _mockValid(bool valid) {
            when(mockControl.untouched).thenReturn(valid);
            when(mockControl.valid).thenReturn(valid);
         }

         _getRequiredError(bool required) {
            return required ? {'required':true} : {};
         }

         _getMinLengthError(bool minLength) {
            return minLength ? {'minlength':true} : {};
         }

         _getMaxLengthError(bool maxLength) {
            return maxLength ? {'maxlength':true} : {};
         }

         group('Is control valid', (){
            var isValidTestCases = [
               { 'untouched': false, 'valid': false, 'result': false},
               { 'untouched': false, 'valid': true, 'result': true},
               { 'untouched': true, 'valid': false, 'result': true},
               { 'untouched': true, 'valid': true, 'result': true},
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
               { 'invalid': false, 'required': false, 'result': false},
               { 'invalid': false, 'required': true, 'result': false},
               { 'invalid': true, 'required': false, 'result': false},
               { 'invalid': true, 'required': true, 'result': true}
            ];

            isRequiredTestCases.forEach((testCase) {
               bool invalid = testCase['invalid'];
               bool required = testCase['required'];
               bool result = testCase['result'];
               bool valid = !invalid;

               test('Should check if control is required. Invalid: $invalid, required: $required, result: $result',
                   () {
                  _mockValid(valid);
                  when(mockControl.errors).thenReturn(required ? {'required':true} : {});

                  expect(component.isRequired(mockControl), result);
               });
            });
         });

         group('Is control length correct', () {

            var isInsufficientLengthTestCases = [
               { 'invalid': false, 'minlength': false, 'result': false},
               { 'invalid': false, 'minlength': true, 'result': false},
               { 'invalid': true, 'minlength': false, 'result': false},
               { 'invalid': true, 'minlength': true, 'result': true}
            ];

            isInsufficientLengthTestCases.forEach((testCase) {
               bool invalid = testCase['invalid'];
               bool minLength = testCase['minlength'];
               bool result = testCase['result'];
               bool valid = !invalid;

               test('Should check if control length is insufficient. Invalid: $invalid, minlength: $minLength, result: $result',
                   () {
                  _mockValid(valid);
                  when(mockControl.errors).thenReturn(minLength ? {'minlength':true} : {});

                  expect(component.isInsufficientLength(mockControl), result);
               });
            });

            var isLengthExcessTestCases = [
               { 'invalid': false, 'maxlength': false, 'result': false},
               { 'invalid': false, 'maxlength': true, 'result': false},
               { 'invalid': true, 'maxlength': false, 'result': false},
               { 'invalid': true, 'maxlength': true, 'result': true}
            ];

            isLengthExcessTestCases.forEach((testCase) {
               bool invalid = testCase['invalid'];
               bool maxLength = testCase['maxlength'];
               bool result = testCase['result'];
               bool valid = !invalid;

               test('Should check if control length is excess. Invalid: $invalid, maxlength: $maxLength, result: $result',
                   () {
                  _mockValid(valid);
                  when(mockControl.errors).thenReturn(maxLength ? {'maxlength':true} : {});

                  expect(component.isLengthExcess(mockControl), result);
               });
            });
         });

         group('Is control has unhandled error', (){
            var isGeneralUnhandledErrorTestCases = [
               { 'invalid': false, 'notRequired': false, 'result': false},
               { 'invalid': false, 'notRequired': true, 'result': false},
               { 'invalid': true, 'notRequired': false, 'result': false},
               { 'invalid': true, 'notRequired': true, 'result': true}
            ];

            isGeneralUnhandledErrorTestCases.forEach((testCase) {
               bool invalid = testCase['invalid'];
               bool notRequired = testCase['notRequired'];
               bool result = testCase['result'];
               bool valid = !invalid;
               bool required = !notRequired;

               test('Should check if general unhandled error. Invalid: $invalid, notRequired: $notRequired, result: $result',
                   () {
                  _mockValid(valid);

                  var errors = _getRequiredError(required);
                  when(mockControl.errors).thenReturn(errors);

                  expect(component.isGeneralUnhandledError(mockControl), result);
               });
            });

            var isPasswordUnhandledErrorTestCases = [
               { 'invalid': false, 'notRequired': true, 'notMinlength': true, 'notMaxlength': true, 'result': false},
               { 'invalid': true, 'notRequired': false, 'notMinlength': true, 'notMaxlength': true, 'result': false},
               { 'invalid': true, 'notRequired': true, 'notMinlength': false, 'notMaxlength': true, 'result': false},
               { 'invalid': true, 'notRequired': true, 'notMinlength': true, 'notMaxlength': false, 'result': false},
               { 'invalid': true, 'notRequired': true, 'notMinlength': true, 'notMaxlength': true, 'result': true}
            ];

            isPasswordUnhandledErrorTestCases.forEach((testCase) {
               bool invalid = testCase['invalid'];
               bool notRequired = testCase['notRequired'];
               bool notMinLength = testCase['notMinlength'];
               bool notMaxLength = testCase['notMaxlength'];

               bool result = testCase['result'];
               bool valid = !invalid;
               bool required = !notRequired;
               bool minLength = !notMinLength;
               bool maxLength = !notMaxLength;

               test('Should check if password unhandled error. '
                   'Invalid: $invalid, notRequired: $notRequired, notMinlength: $notMinLength, notMaxlength: $notMaxLength, result: $result',
                   () {
                  _mockValid(valid);

                  var errors = {}
                     ..addAll(_getRequiredError(required))
                     ..addAll(_getMinLengthError(minLength))
                     ..addAll(_getMaxLengthError(maxLength));

                  when(mockControl.errors).thenReturn(errors);

                  expect(component.isPasswordUnhandledError(mockControl), result);
               });
            });
         });
      });
   }
}

void main() {
   FormComponentTests.run();
}