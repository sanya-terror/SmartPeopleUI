import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:angular2/router.dart';

import 'package:angular2_material/src/components/button/button.dart';
import 'package:angular2_material/src/components/checkbox/checkbox.dart';

import 'package:SmartPeopleUI/shared/index.dart';
import 'package:SmartPeopleUI/account-management/index.dart';

@Component(
selector: 'sp-login',
directives: const [
   ROUTER_DIRECTIVES,
   ValidationNotificationComponent,
   MdButton,
   MdCheckbox
],
providers: const [ InjectableStore
],
templateUrl: 'login.component.html',
encapsulation: ViewEncapsulation.Native,
//TODO it is temporary, in further should remove and avoid
styleUrls: const ['login.component.css'])
class LoginComponent extends FormComponent{

   ControlGroup form;
   InjectableStore _store;
   LocalStorageService _localStorage;

   LoginComponent(this._store, this._localStorage) {

      this.form = new ControlGroup({
         'email': new Control('', Validators.compose([
            EmailValidator.validate,
            Validators.required
         ])),
         'password': new Control('', Validators.compose([
            PasswordValidator.validate,
            Validators.required,
            Validators.minLength(6),
            Validators.maxLength(18)
         ]))
      });

      _store.listen(_onLoginSuccess);
   }

   login() {

      if (!form.valid) return;

      _store.dispatch(AuthActionCreator.requestLogin({
         'user': this.form.controls['email'].value,
         'password': this.form.controls['password'].value,
      }));
   }

   _onLoginSuccess(state) {
      var token = state['token'];
      if (token == null) return;
      _localStorage.setItem('token', token);
   }
}
