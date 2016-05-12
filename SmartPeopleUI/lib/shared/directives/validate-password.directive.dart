import 'package:angular2/core.dart';
import 'package:angular2/common.dart';

import '../validators/password.validator.dart';

@Directive(
  selector: '[sp-validate-password][ngControl]',
  providers: const [
    const Provider(NG_VALIDATORS, useValue: PasswordValidator.validate, multi: true)
  ]
)
class PasswordValidatorDirective {}