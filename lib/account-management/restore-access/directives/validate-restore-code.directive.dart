import 'package:angular2/angular2.dart' show Directive, NG_VALIDATORS, Provider;
import 'package:SmartPeopleUI/index.dart' show RestoreCodeValidator;

const RESTORE_CODE = RestoreCodeValidator.validate;
const RESTORE_CODE_VALIDATOR = const Provider(NG_VALIDATORS, useValue: RESTORE_CODE, multi: true);

@Directive(
   selector: '[sp-validate-restore-code][ngControl]',
   providers: const [RESTORE_CODE_VALIDATOR])
class RestoreCodeValidatorDirective {}
