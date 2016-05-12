import 'package:test/test.dart';
import 'package:SmartPeopleUI/shared/validators/password.validator.dart';
import 'package:angular2/common.dart';

class PasswordValidatorTests {
   static run() {
      group('PasswordValidator', () {

         var success = null;
         var failed = { 'validatePassword': true};

         List<Map<String, dynamic>> cases = [
            { 'password': '1234567', 'result': success},
            { 'password': '123456789012345678', 'result': success},
            { 'password': 'skSomePswrd12345', 'result': success},

            { 'password': '12345', 'result': failed},
            { 'password': '12345678901234567890', 'result': failed},
            { 'password': '!12390', 'result': failed},
            { 'password': 'dd dd', 'result': failed},
         ];

         cases.forEach((testCase) {

            var password = testCase['password'];
            var result = testCase['result'];

            test('Should validate password ${password}', () {
               var control = new Control(password);
               expect(PasswordValidator.validate(control), result, reason: password);
            });
         });

         test('Should be valid if control value is null', () {
            var control = new Control();
            expect(PasswordValidator.validate(control), null);
         });

      });
   }
}

void main() {
   PasswordValidatorTests.run();
}








