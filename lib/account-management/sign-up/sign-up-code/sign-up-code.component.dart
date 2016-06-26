import 'package:angular2/angular2.dart'
    show
    Component,
    Control,
    ControlGroup,
    Validators;

import 'package:SmartPeopleUI/index.dart'
    show
    ErrorTooltipComponent,
    InputComponent,
    CheckboxComponent,
    LinkComponent,
    CardComponent,
    ButtonComponent,
    RadioButtonComponent,
    FormComponent,
    EmailValidator,
    RestoreCodeValidator,
    InjectableStore,
    PasswordValidator,
    SignUpData,
    SignUpActionCreator,
    AuthActionCreator;

@Component(
    selector: 'sp-sign-up-code',
    directives: const [InputComponent, ButtonComponent],
    templateUrl: 'sign-up-code.component.html')

class SignUpCodeComponent extends FormComponent {

   final InjectableStore _store;

   bool isInvalidCode = false;
   bool isApplyingCodeError = false;

   String email;
   String password;

   Control codeControl;

   ControlGroup form;

   SignUpCodeComponent(this._store) {
      this.codeControl = new Control('12345678', Validators.compose([RestoreCodeValidator.validate, Validators.required]));
      this.form = new ControlGroup({ 'code': this.codeControl});
   }

   _onStateChange(SignUpData data) async {
      email = _store.state['email'];
      password = data.password;
      isApplyingCodeError = data.errorCode == 4444;

      if (!isApplyingCodeError) {
         await _store.dispatch(SignUpActionCreator.clearSignUp());
         await _store.dispatch(AuthActionCreator.requestLogin({
            'user': email,
            'password': password
         }));
      }
   }

   confirmCode() {
      if (!form.valid) return;

      _store.map((state) => state['signUp']).where((data)=>data!=null).take(1).listen(_onStateChange);
      _store.dispatch(SignUpActionCreator.applyConfirmationCode(codeControl.value));
   }
}
