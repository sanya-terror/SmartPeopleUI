import 'package:angular2/common.dart';

class PasswordValidator {

   static Map<String, bool> validate(Control control) {

      if (control.value == null) return null;

      var regex = new RegExp(r'^\w{6,18}$', caseSensitive: true);
      return regex.hasMatch(control.value) ? null : { 'validatePassword': true};
   }
}