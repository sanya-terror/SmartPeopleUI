import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:angular2/router.dart';
import 'package:angular2_rbi/directives.dart' show MaterialButton, MaterialCheckbox, MaterialTextfield;

import 'package:SmartPeopleUI/shared/index.dart';
import 'package:SmartPeopleUI/account-management/index.dart';
import 'package:SmartPeopleUI/shared/components/controls/text-field/text-field.component.dart';

@Component(
    selector: 'sp-login',
    directives: const [
      ROUTER_DIRECTIVES,
      ErrorTooltipComponent,
      MaterialButton,
      MaterialTextfield,
      MaterialCheckbox,
      InputComponent
    ],
    templateUrl: 'login.component.html',
    encapsulation: ViewEncapsulation.Emulated,
    styleUrls: const ['login.component.css'])
class LoginComponent extends FormComponent {

  ControlGroup form;
  Control emailControl;
  Control passwordControl;

  final InjectableStore _store;

  LoginComponent(this._store) {
    this.emailControl = new Control('', Validators.compose([EmailValidator.validate, Validators.required]));
    this.passwordControl = new Control(
          '',
          Validators.compose([
            PasswordValidator.validate,
            Validators.required,
            Validators.minLength(6),
            Validators.maxLength(18)
          ]));
    this.form = new ControlGroup({
      'email': emailControl,
      'password': passwordControl
    });
  }

  login() {
    if (!form.valid) return;

    _store.dispatch(AuthActionCreator.requestLogin({
      'user': this.form.controls['email'].value,
      'password': this.form.controls['password'].value,
    }));
  }
}
