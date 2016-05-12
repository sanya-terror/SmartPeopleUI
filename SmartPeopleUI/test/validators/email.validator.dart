import 'package:test/test.dart';
import 'package:SmartPeopleUI/shared/validators/email.validator.dart';
import 'package:angular2/common.dart';

class EmailValidatorTests {
  static run() {
    group('EmailValidator', () {
      
      var success = null;
      var failed = { 'validateEmail': true}; 
      
      List<Map<String, dynamic>> cases = [
        { 'email': 'prettyandsimple@example.com', 'result': success},
        { 'email': 'very.common@example.com', 'result': success},
        { 'email': 'disposable.style.email.with+symbol@example.com', 'result': success},
        { 'email': 'other.email-with-dash@example.com', 'result': success},
        { 'email': 'x@example.com (one-letter local part)', 'result': success},
        { 'email': 'example-indeed@strange-example.com', 'result': success},
        { 'email': 'admin@mailserver1 (local domain name with no TLD)', 'result': success},
        { 'email': '#!\$%&\'*+-/=?^_`{}|~@example.org', 'result': success},
        { 'email': 'example@localhost (sent from localhost)', 'result': success},
        { 'email': 'example@s.solutions (see the List of Internet top-level domains)', 'result': success},
        { 'email': 'user@com', 'result': success},
        { 'email': 'user@localserver', 'result': success},

        { 'email': '"much.more unusual"@example.com', 'result': failed},
        { 'email': 'Abc.example.com', 'result': failed},
        { 'email': 'a"b(c)d,e:f;g<h>i[j\\k]l@example.com', 'result': failed},
        { 'email': 'just"not"right@example.com', 'result': failed},
        { 'email': 'this is"not\\allowed@example.com', 'result': failed},
        { 'email': 'this\\ still\\"not\\\\allowed@example.com', 'result': failed},
        { 'email': ' prettyandsimple@example.com', 'result': failed},
      ];

      cases.forEach((testCase) {

        var email = testCase['email'];
        var result = testCase['result'];

        test('Should validate email ${email}', () {
          var control = new Control(email);
          expect(EmailValidator.validate(control), result, reason: email);
        });
      });

      test('Should be valid if control value is null', () {
        var control = new Control();
        expect(EmailValidator.validate(control), null);
      });

    });
  }
}

void main() {
  EmailValidatorTests.run();
}








