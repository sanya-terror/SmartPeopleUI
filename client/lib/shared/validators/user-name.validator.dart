import 'package:angular2/common.dart';

class UserNameValidator {
  static Map<String, bool> validate(AbstractControl control) {
    if (control.value == null) return null;

    var regex = new RegExp(r'^[a-zA-Z0-9]+([a-zA-Z0-9](_|-| )[a-zA-Z0-9])*[a-zA-Z0-9]+$', caseSensitive: true);
    return regex.hasMatch(control.value) ? null : {'validateUserName': true};
  }
}
