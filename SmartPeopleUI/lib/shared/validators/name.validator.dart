import 'package:angular2/common.dart';

class NameValidator {

   static Map<String, bool> validate(Control control) {
      var regex = new RegExp(
          r'^[a-z,A-Z,а-яіїєґ,А-ЯІЇЄҐ]{2,20}$',
          caseSensitive: true
      );
      return regex.hasMatch(control.value) ? null : { 'validateName': true};
   }
}