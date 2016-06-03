import 'package:angular2/common.dart';

class NameValidator {
  static Map<String, bool> validate(AbstractControl control) {
    if (control.value == null) return null;

    var regex =
        new RegExp(r"^[a-z,A-Z,а-яіїєґ,А-ЯІЇЄҐ, .'-]+$", caseSensitive: true);
    return regex.hasMatch(control.value) ? null : {'validateName': true};
  }
}
