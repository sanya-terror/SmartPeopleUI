import 'package:test/test.dart';
import 'package:SmartPeopleUI/shared/validators/name.validator.dart';
import 'package:angular2/common.dart';

class NameValidatorTests {
   static run() {
      group('NameValidator', () {

         var success = null;
         var failed = { 'validateName': true};

         List<Map<String, dynamic>> cases = [
            { 'name': 'Jo hn Dou', 'result': success},
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
      });
   }
}

void main() {
   NameValidatorTests.run();
}








