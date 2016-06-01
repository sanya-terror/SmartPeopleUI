import 'package:test/test.dart';
import 'package:angular2/common.dart';
import 'package:mockito/mockito.dart';
import 'package:SmartPeopleUI/shared/form.component.dart';

class MockNgControlName extends Mock implements NgControlName {
   noSuchMethod(i) => super.noSuchMethod(i);
}

class FormComponentTests {
   static run() {
      group('Api actions', () {
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

         _mockRequired(bool required) {
            when(mockControl.errors).thenReturn(required ? {'required':true} : {});
         }

         group('Is control valid', (){
            var isValidTestCases = [
               { 'untoched': false, 'valid': false, 'result': false},
               { 'untoched': false, 'valid': true, 'result': true},
               { 'untoched': true, 'valid': false, 'result': true},
               { 'untoched': true, 'valid': true, 'result': true},

            ];

            isValidTestCases.forEach((testCase) {
               bool untoched = testCase['untoched'];
               bool valid = testCase['valid'];
               bool result = testCase['result'];

               test('Should check if control is valid. Untoched: $untoched, valid: $valid, result: $result', () {
                  when(mockControl.untouched).thenReturn(untoched);
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
               bool minlength = testCase['minlength'];
               bool result = testCase['result'];
               bool valid = !invalid;

               test('Should check if control length is insufficient. Invalid: $invalid, minlength: $minlength, result: $result',
                   () {
                  _mockValid(valid);
                  when(mockControl.errors).thenReturn(
                      minlength ? {'minlength':true} : {});

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
               bool maxlength = testCase['maxlength'];
               bool result = testCase['result'];
               bool valid = !invalid;

               test('Should check if control length is excess. Invalid: $invalid, maxlength: $maxlength, result: $result',
                   () {
                  _mockValid(valid);
                  when(mockControl.errors).thenReturn(
                      maxlength ? {'maxlength':true} : {});

                  expect(component.isLengthExcess(mockControl), result);
               });
            });
         });

         group('Is control has general unhandled error', (){
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
                  _mockRequired(required);

                  expect(component.isGeneralUnhandledError(mockControl), result);
               });
            });
         });
      });
   }
}

void main() {
   FormComponentTests.run();
}