import 'package:angular2/core.dart';
import 'package:angular2/common.dart';

import '../validators/restore-code.validator.dart';

@Directive(
    selector: '[sp-validate-restore-code][ngControl]',
    providers: const [
      const Provider(
          NG_VALIDATORS,
          useValue: RestoreCodeValidator.validate, multi: true)
])
class RestoreCodeValidatorDirective {}
