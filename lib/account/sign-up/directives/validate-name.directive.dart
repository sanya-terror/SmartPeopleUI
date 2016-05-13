import 'package:angular2/core.dart';
import 'package:angular2/common.dart';

import '../validators/name.validator.dart';

@Directive(
  selector: '[sp-validate-name][ngControl]',
  providers: const [
    const Provider(
        NG_VALIDATORS,
        useValue: NameValidator.validate,
        multi: true
    )
  ]
)
class NameValidatorDirective {}