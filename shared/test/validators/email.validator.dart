import 'package:test/test.dart';
import 'package:smartpeople_shared/src/validators/email.validator.dart';

class EmailValidatorTests {
  static run() {
    group('EmailValidator', () {
      List<Map<String, dynamic>> cases = [
        {'email': null, 'result': true},
        {'email': 'prettyandsimple@example.com', 'result': true},
        {'email': 'very.common@example.com', 'result': true},
        {'email': 'disposable.style.email.with+symbol@example.com', 'result': true},
        {'email': 'other.email-with-dash@example.com', 'result': true},
        {'email': 'x@example.com (one-letter local part)', 'result': true},
        {'email': 'example-indeed@strange-example.com', 'result': true},
        {'email': 'admin@mailserver1 (local domain name with no TLD)', 'result': true},
        {'email': '#!\$%&\'*+-/=?^_`{}|~@example.org', 'result': true},
        {'email': 'example@localhost (sent from localhost)', 'result': true},
        {'email': 'example@s.solutions (see the List of Internet top-level domains)', 'result': true},
        {'email': 'user@com', 'result': true},
        {'email': 'user@localserver', 'result': true},
        {'email': '"much.more unusual"@example.com', 'result': false},
        {'email': 'Abc.example.com', 'result': false},
        {'email': 'a"b(c)d,e:f;g<h>i[j\\k]l@example.com', 'result': false},
        {'email': 'just"not"right@example.com', 'result': false},
        {'email': 'this is"not\\allowed@example.com', 'result': false},
        {'email': 'this\\ still\\"not\\\\allowed@example.com', 'result': false},
        {'email': ' prettyandsimple@example.com', 'result': false},
      ];

      cases.forEach((testCase) {
        var email = testCase['email'];
        var result = testCase['result'];

        test('Should validate email $email', () {
          expect(EmailValidator.validate(email), result, reason: email);
        });
      });
    });
  }
}

void main() {
  EmailValidatorTests.run();
}
