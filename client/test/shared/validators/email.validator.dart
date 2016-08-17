import 'package:test/test.dart';
import 'package:smartpeople_client/shared/validators/email.validator.dart';
import 'package:angular2/common.dart';

class EmailValidatorTests {
  static run() {
    group('EmailValidator', () {
      var success;
      var failed = {'validateEmail': true};

      List<Map<String, dynamic>> cases = [
        {'email': null, 'result': success},
        {'email': 'prettyandsimple@example.com', 'result': success},
        {'email': '"much.more unusual"@example.com', 'result': failed},
      ];

      cases.forEach((testCase) {
        var email = testCase['email'];
        var result = testCase['result'];

        test('Should validate email $email', () {
          var control = new Control(email);
          expect(EmailValidator.validate(control), result, reason: email);
        });
      });
    });
  }
}

void main() {
  EmailValidatorTests.run();
}
