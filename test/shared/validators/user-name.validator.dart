import 'package:test/test.dart';
import 'package:SmartPeopleUI/shared/validators/user-name.validator.dart';
import 'package:angular2/common.dart';

class UserNameValidatorTests {
  static run() {
    group('UserNameValidator', () {
      var success = null;
      var failed = {'validateUserName': true};

      List<Map<String, dynamic>> cases = [
        {'userName': 'sanya-terror', 'result': success},
        {'userName': 'ne4istb', 'result': success},
        {'userName': 'innowate', 'result': success},
        {'userName': 'baron_1991', 'result': success},
        {'userName': '?user123', 'result': failed},
        {'userName': 'user/12345', 'result': failed},
        {'userName': 'baron/dd', 'result': failed},
        {'userName': '1234567 r', 'result': failed}
      ];

      cases.forEach((testCase) {
        var userName = testCase['userName'];
        var result = testCase['result'];

        test('Should validate userName ${userName}', () {
          var control = new Control(userName);
          expect(UserNameValidator.validate(control), result, reason: userName);
        });
      });

      test('Should be valid if control value is null', () {
        var control = new Control();
        expect(UserNameValidator.validate(control), null);
      });
    });
  }
}

void main() {
  UserNameValidatorTests.run();
}
