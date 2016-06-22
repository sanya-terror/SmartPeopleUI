import 'package:angular2/angular2.dart' show Directive, NG_VALIDATORS, Provider;
import 'package:SmartPeopleUI/index.dart' show PasswordValidator;

const PASSWORD = PasswordValidator.validate;
const PASSWORD_VALIDATOR = const Provider(NG_VALIDATORS, useValue: PASSWORD, multi: true);

@Directive(selector: '[sp-validate-password][ngControl]', providers: const [PASSWORD_VALIDATOR])
class PasswordValidatorDirective {}
