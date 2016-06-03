import 'package:test/test.dart';
import 'package:angular2/common.dart';
import 'package:SmartPeopleUI/account-management/sign-up/validators/index.dart';

class NameValidatorTests {
   static run() {
      group('NameValidator', () {

         var success = null;
         var failed = { 'validateName': true};

         List<Map<String, dynamic>> cases = [
            { 'name': 'John Dou', 'result': success},
            { 'name': 'Cary-Hiroyuki Tagawa', 'result': success},

            { 'name': 'Chris Evans1', 'result': failed},
            { 'name': 'Robert+Downey Jr.', 'result': failed},
         ];

         cases.forEach((testCase) {

            var name = testCase['name'];
            var result = testCase['result'];

            test('Should validate name ${name}', () {
               var control = new Control(name);
               expect(NameValidator.validate(control), result, reason: name);
            });
         });

         test('Should be valid if control value is null', () {
            var control = new Control();
            expect(NameValidator.validate(control), null);
         });

      });
   }
}

void main() {
   NameValidatorTests.run();
}








