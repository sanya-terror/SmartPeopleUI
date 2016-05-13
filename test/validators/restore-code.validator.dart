import 'package:test/test.dart';
import 'package:SmartPeopleUI/account/restore-access/validators/restore-code.validator.dart';
import 'package:angular2/common.dart';

class RestoreCodeValidatorTests {
   static run() {
      group('RestoreCodeValidator', () {

         var success = null;
         var failed = { 'validateRestoreCode': true};

         List<Map<String, dynamic>> cases = [
            { 'code': '12345678', 'result': success},
            { 'code': 'qwertyui', 'result': success},
            { 'code': '1q2w3e4r', 'result': success},

            { 'code': '123456789', 'result': failed},
            { 'code': '123567', 'result': failed},
            { 'code': '1234+678', 'result': failed},
            { 'code': 'abcd_efg', 'result': failed},
         ];

         cases.forEach((testCase) {

            var code = testCase['code'];
            var result = testCase['result'];

            test('Should validate restore code ${code}', () {
               var control = new Control(code);
               expect(RestoreCodeValidator.validate(control), result, reason: code);
            });
         });

         test('Should be valid if control value is null', () {
            var control = new Control();
            expect(RestoreCodeValidator.validate(control), null);
         });

      });
   }
}

void main() {
   RestoreCodeValidatorTests.run();
}








