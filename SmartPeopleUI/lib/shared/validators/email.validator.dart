import 'package:angular2/common.dart';

class EmailValidator {

  static Map<String, bool> validate(Control control) {
    var regex = new RegExp(
      '^[a-z0-9!#\$%&\'*+\/=?^_`{|}~.-]+@[a-z0-9]([a-z0-9-]*[a-z0-9])?(\.[a-z0-9]([a-z0-9-]*[a-z0-9])?)*',
      caseSensitive: false);
    return regex.hasMatch(control.value) ? null : { 'validateEmail': true};
  }
}