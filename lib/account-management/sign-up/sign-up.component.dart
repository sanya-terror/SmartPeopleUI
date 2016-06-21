import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:angular2/router.dart';
import 'package:angular2_rbi/directives.dart' show MaterialRadio;

import 'package:SmartPeopleUI/shared/index.dart';
import 'index.dart';

@Component(
    selector: 'sign-up',
    directives: const [
      ROUTER_DIRECTIVES,
      ErrorTooltipComponent,
      InputComponent,
      CheckboxComponent,
      LinkComponent,
      CardComponent,
      ButtonComponent,
      MaterialRadio
    ],
    styleUrls: const ['sign-up.component.css'],
    encapsulation: ViewEncapsulation.Emulated,
    templateUrl: 'sign-up.component.html')
class SignUpComponent extends FormComponent {

  ControlGroup form;
  Control nameControl;
  Control surnameControl;
  Control emailControl;
  Control passwordControl;
  Control passwordRepeatControl;
  Control genderControl;

  SignUpComponent() {
    this.nameControl = new Control('', Validators.compose([NameValidator.validate, Validators.required]));
    this.surnameControl = new Control('', Validators.compose([NameValidator.validate, Validators.required]));
    this.emailControl = new Control('', Validators.compose([EmailValidator.validate, Validators.required]));
    this.passwordControl = new Control('',
       Validators.compose([
         PasswordValidator.validate,
         Validators.required,
         Validators.minLength(6),
         Validators.maxLength(18)
       ]));
    this.passwordRepeatControl = new Control('',
          Validators.compose([PasswordValidator.validate, Validators.required]));
    this.genderControl = new Control('male');

    this.form = new ControlGroup({
      'name': this.nameControl,
      'surname': this.surnameControl,
      'email': this.emailControl,
      'password': this.passwordControl,
      'passwordRepeat': this.passwordRepeatControl,
      'gender': this.genderControl
    });
  }
}
