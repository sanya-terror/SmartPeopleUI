import 'package:angular2/angular2.dart' show Directive, NG_VALIDATORS, Provider;
import 'package:smartpeople_client/index.dart' show EmailValidator;

const EMAIL = EmailValidator.validate;
const EMAIL_VALIDATOR = const Provider(NG_VALIDATORS, useValue: EMAIL, multi: true);

@Directive(selector: '[sp-validate-email][ngControl]', providers: const [EMAIL_VALIDATOR])
class EmailValidatorDirective {}
