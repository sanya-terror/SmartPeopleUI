import 'package:angular2/angular2.dart' show Component, Control, ControlGroup, Validators;
import 'package:SmartPeopleUI/index.dart'
   show FormComponent, PasswordValidator, ButtonComponent, InputComponent,
      RestoreAccessActionCreator, RestoreAccessData, AuthActionCreator;

import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart' show InjectableStore;
import 'package:SmartPeopleUI/redux/index.dart' show State;

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
   bool isPasswordChanged = false;
   String email = null;

   ChangePasswordComponent(this._store) {

      this.passwordControl = new Control('777777',
          Validators.compose([
             PasswordValidator.validate,
             Validators.required,
             Validators.minLength(6),
             Validators.maxLength(18)
          ]));

      this.passwordRepeatControl = new Control('777777',
          Validators.compose(
              [PasswordValidator.validate, Validators.required]));

      this.form = new ControlGroup({
         'password': this.passwordControl,
         'passwordRepeat': this.passwordRepeatControl
    });
  }

   _onStateChange(State state) async {
      RestoreAccessData restoreAccess = state['restoreAccess'];

      email = restoreAccess?.email;
      isPasswordChanged = restoreAccess?.isPasswordChanged;
      isPasswordChangingError = restoreAccess?.isPasswordChangingError;

      if (isPasswordChanged) {
         await _store.dispatch(RestoreAccessActionCreator.clearRestoreAccess());
         await _store.dispatch(AuthActionCreator.requestLogin({
            'user': email,
            'password': passwordControl.value
         }));

      }

   }

   applyPasswordChanging() {
      if (!form.valid) return;

      String restoreToken = (_store.state['restoreAccess'] as RestoreAccessData)?.changePasswordToken;
      _store.dispatch(RestoreAccessActionCreator.applyPasswordChanging(passwordControl.value, restoreToken));
      _store.take(1).listen(_onStateChange);
   }

}
