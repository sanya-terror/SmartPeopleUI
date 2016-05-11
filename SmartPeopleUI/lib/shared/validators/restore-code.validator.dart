import 'package:angular2/common.dart';

class RestoreCodeValidator {

   static Map<String, bool> validate(Control control) {
      var regex = new RegExp(
          r'^[0-9a-z]{8}$',
          caseSensitive: true
      );
      return regex.hasMatch(control.value) ? null : { 'validateRestoreCode': true};
   }
}