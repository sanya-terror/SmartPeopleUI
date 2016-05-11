import 'package:angular2/common.dart';

class PasswordValidator {

   static Map<String, bool> validate(Control control) {
      var regex = new RegExp(r'^\w{6,18}$', caseSensitive: true);
      return regex.hasMatch(control.value) ? null : { 'validatePassword': true};
   }
}