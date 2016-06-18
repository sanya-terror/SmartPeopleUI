import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:angular2/router.dart';
import 'package:angular2_rbi/directives.dart';

import 'package:SmartPeopleUI/shared/index.dart';
import 'package:SmartPeopleUI/account-management/index.dart';

@Component(
    selector: 'sp-login',
    directives: const [
      ROUTER_DIRECTIVES,
      ValidationNotificationComponent,
      MaterialButton,
       MaterialTextfield,
    ],
    templateUrl: 'login.component.html',
    encapsulation: ViewEncapsulation.Emulated,
    styleUrls: const ['login.component.css'])
class LoginComponent extends FormComponent {
  ControlGroup form;
  final InjectableStore _store;

  LoginComponent(this._store) {
    this.form = new ControlGroup({
      'email': new Control('',
          Validators.compose([EmailValidator.validate, Validators.required])),
      'password': new Control(
          '',
          Validators.compose([
            PasswordValidator.validate,
            Validators.required,
            Validators.minLength(6),
            Validators.maxLength(18)
          ]))
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
