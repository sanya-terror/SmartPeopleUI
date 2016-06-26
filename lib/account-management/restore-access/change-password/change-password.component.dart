import 'package:angular2/angular2.dart' show Component, Control, ControlGroup, Validators;
import 'package:SmartPeopleUI/index.dart'
   show FormComponent, PasswordValidator, ButtonComponent, InputComponent,
      RestoreAccessActionCreator, RestoreAccessData, AuthActionCreator;

import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart' show InjectableStore;

@Component(
    selector: 'sp-change-password',
    directives: const [ButtonComponent, InputComponent],
    templateUrl: 'change-password.component.html')

class ChangePasswordComponent extends FormComponent {

   final InjectableStore _store;

   Control passwordControl;
   Control passwordRepeatControl;
   ControlGroup form;

   bool isPasswordChangingError = false;

   ChangePasswordComponent(this._store) {

      this.passwordControl = new Control('777777',
          Validators.compose([
             PasswordValidator.validate,
             Validators.required,
             Validators.minLength(6),
             Validators.maxLength(18)
          ]));

      this.passwordRepeatControl = new Control('777777',
          Validators.compose([PasswordValidator.validate, Validators.required]));

      this.form = new ControlGroup({
         'password': this.passwordControl,
         'passwordRepeat': this.passwordRepeatControl
    });
  }

   _onStateChange(RestoreAccessData data) async {

      isPasswordChangingError = data.errorCode == 3333;

      if (!isPasswordChangingError) {
         await _store.dispatch(RestoreAccessActionCreator.clearRestoreAccess());
         await _store.dispatch(AuthActionCreator.requestLogin({
            'user': data.email,
            'password': passwordControl.value
         }));
      }
   }

   applyPasswordChanging() {
      if (!form.valid) return;

      String restoreToken = (_store.state['restoreAccess'] as RestoreAccessData)?.changePasswordToken;

      _store.map((state) => state['restoreAccess']).where((data) => data != null).take(1).listen(_onStateChange);
      _store.dispatch(RestoreAccessActionCreator.applyPasswordChanging(passwordControl.value, restoreToken));
   }

}
