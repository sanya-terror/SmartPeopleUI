import 'package:angular2/common.dart';
import 'package:smartpeople_shared/validators.dart' as shared;

class EmailValidator {
  static Map<String, bool> validate(AbstractControl control) {
    return shared.EmailValidator.validate(control.value) ? null : {'validateEmail': true};
  }
}
