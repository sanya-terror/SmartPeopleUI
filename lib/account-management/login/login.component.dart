import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:angular2/router.dart';
import 'package:angular2_rbi/directives.dart' show MaterialButton, MaterialCheckbox, MaterialTextfield;

import 'package:SmartPeopleUI/shared/index.dart';
import 'package:SmartPeopleUI/account-management/index.dart';
import 'package:SmartPeopleUI/shared/components/controls/index.dart';

@Component(
    selector: 'sp-login',
    directives: const [
      ROUTER_DIRECTIVES,
      ErrorTooltipComponent,
      MaterialButton,
      InputComponent,
      CheckboxComponent,
      LinkComponent,
      CardComponent
    ],
    templateUrl: 'login.component.html',
    encapsulation: ViewEncapsulation.Emulated,
    styleUrls: const ['login.component.css'])
class LoginComponent extends FormComponent {

  ControlGroup form;
  Control emailControl;
  Control passwordControl;
  Control rememberMeControl;

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
    this.rememberMeControl = new Control('');

    this.form = new ControlGroup({
      'email': emailControl,
      'password': passwordControl,
      'rememberMe': rememberMeControl
    });
  }

  login() {
    if (!form.valid) return;

    _store.dispatch(AuthActionCreator.requestLogin({
      'user': emailControl.value,
      'password': passwordControl.value,
      'rememberMe': rememberMeControl.value,
    }));
  }
}
