import 'package:angular2/angular2.dart'show Component, Control, ControlGroup, Validators;

import 'package:angular2_material/src/components/button/button.dart' show MdButton;
import 'package:SmartPeopleUI/index.dart' show FormComponent, PasswordValidator, ValidationNotificationComponent;

@Component(
    selector: 'sp-change-password',
    directives: const [
      ValidationNotificationComponent,
      MdButton
    ],
    templateUrl: 'change-password.component.html')
class ChangePasswordComponent extends FormComponent {
  ControlGroup form;

  ChangePasswordComponent() {
    this.form = new ControlGroup({
      'password': new Control(
          '',
          Validators.compose([
            PasswordValidator.validate,
            Validators.required,
            Validators.minLength(6),
            Validators.maxLength(18)
          ])),
      'passwordRepeat': new Control('',
          Validators.compose([PasswordValidator.validate, Validators.required])),
    });
  }
}
