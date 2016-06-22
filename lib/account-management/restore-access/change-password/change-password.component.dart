import 'package:angular2/angular2.dart' show Component, Control, ControlGroup, Validators;
import 'dart:html' show window;
import 'package:SmartPeopleUI/index.dart' show FormComponent, PasswordValidator, ValidationNotificationComponent, InjectableStore, RestoreAccessActionCreator, RestoreAccessData;

@Component(
    selector: 'sp-change-password',
    directives: const [ValidationNotificationComponent],
    templateUrl: 'change-password.component.html')

class ChangePasswordComponent extends FormComponent {

   final InjectableStore _store;

   Control passwordControl;
   Control passwordRepeatControl;
   ControlGroup form;

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

   applyPasswordChanging() {
      String restoreToken = (_store.state['restoreAccess'] as RestoreAccessData)?.changePasswordToken;
      _store.dispatch(RestoreAccessActionCreator.applyPasswordChanging(passwordControl.value, restoreToken));

      bool isPasswordChangingError = (_store.state['restoreAccess'] as RestoreAccessData)?.passwordChangingError;

      if (isPasswordChangingError) window.alert('Error while password changing');
      else window.alert('Password is changed');

   }

}
