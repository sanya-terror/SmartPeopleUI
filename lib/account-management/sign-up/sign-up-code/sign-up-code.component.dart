import 'package:angular2/angular2.dart'
    show Component, Control, ControlGroup, Validators;

import 'package:SmartPeopleUI/index.dart'
    show InputComponent, ButtonComponent, FormComponent,
    RestoreCodeValidator, SignUpActionCreator, SignUpData, AuthActionCreator;

import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart';

@Component(
    selector: 'sp-sign-up-code',
    directives: const [InputComponent, ButtonComponent],
    templateUrl: 'sign-up-code.component.html'
)

class SignUpCodeComponent extends FormComponent {

   final InjectableStore _store;

   bool isApplyingCodeError = false;

   Control codeControl;
   ControlGroup form;

   SignUpCodeComponent(this._store) {
      this.codeControl = new Control('', Validators.compose([
         RestoreCodeValidator.validate,
         Validators.required
      ]));
      this.form = new ControlGroup({ 'code': this.codeControl});
   }

   _onStateChange(SignUpData data) {
      isApplyingCodeError = data.errorCode == 4444;
      if (!isApplyingCodeError) {
         _store.dispatch(SignUpActionCreator.clearSignUp());
         _store.dispatch(AuthActionCreator.requestLogin({
            'user': _store.state['email'],
            'password': data.password
         }));
      }
   }

   confirmCode() {
      if (!form.valid) return;

      _subscribeOnceForSignUpData();
      _store.dispatch(SignUpActionCreator.applyConfirmationCode(codeControl.value));
   }

   _subscribeOnceForSignUpData() {
      _store
         .map((state) => state['signUp'])
         .where((data) => data != null)
         .take(1)
         .listen(_onStateChange);
   }
}
