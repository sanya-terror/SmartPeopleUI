import 'package:angular2/core.dart';
import 'package:angular2/common.dart';

import '../validators/email.validator.dart';

@Directive(selector: '[sp-validate-email][ngControl]', providers: const [
  const Provider(NG_VALIDATORS, useValue: EmailValidator.validate, multi: true)
])
class EmailValidatorDirective {}
