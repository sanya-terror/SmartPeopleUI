import 'package:angular2/common.dart' show AbstractControl;

class RestoreCodeValidator {
  static Map<String, bool> validate(AbstractControl control) {
    if (control.value == null) return null;

    var regex = new RegExp(r'^[0-9a-zA-Z]{8}$', caseSensitive: true);
    return regex.hasMatch(control.value) ? null : {'validateRestoreCode': true};
  }
}
