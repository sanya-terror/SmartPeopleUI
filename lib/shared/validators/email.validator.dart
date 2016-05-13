import 'package:angular2/common.dart';

class EmailValidator {

  static Map<String, bool> validate(Control control) {

    if (control.value == null) return null;

    var regex = new RegExp(
      '^[a-z0-9!#\$%&\'*+\/=?^_`{|}~.-]+@[a-z0-9]([a-z0-9-]*[a-z0-9])?(\.[a-z0-9]([a-z0-9-]*[a-z0-9])?)*',
      caseSensitive: false);

    return regex.hasMatch(control.value) ? null : { 'validateEmail': true};
  }
}