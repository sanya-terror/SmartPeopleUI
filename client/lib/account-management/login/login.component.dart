import 'package:angular2/core.dart' show Component, ViewEncapsulation;
import 'package:angular2/common.dart' show AbstractControl, Control, ControlGroup, Validators;

import 'package:smartpeople_client/index.dart'
    show
        FormComponent,
        EmailValidator,
        PasswordValidator,
        AuthActionCreator,
        InputComponent,
        CheckboxComponent,
        LinkComponent,
        CardComponent,
        ButtonComponent;

import 'package:smartpeople_client/redux/index.dart' show State;

import 'package:smartpeople_client/shared/services/injectable-store.service.dart' show InjectableStore;

@Component(
    selector: 'sp-login',
    directives: const [InputComponent, CheckboxComponent, LinkComponent, CardComponent, ButtonComponent],
    templateUrl: 'login.component.html',
    encapsulation: ViewEncapsulation.Emulated,
    styleUrls: const ['login.component.css'])
class LoginComponent extends FormComponent {
  ControlGroup form;
  Control emailControl;
  Control passwordControl;
  Control rememberMeControl;

  bool isInvalidCredentialsError = false;

  final InjectableStore _store;

  LoginComponent(this._store) {
    this.emailControl = new Control('', Validators.compose([EmailValidator.validate, Validators.required]));
    this.passwordControl = new Control(
        '',
        Validators.compose(
            [PasswordValidator.validate, Validators.required, Validators.minLength(6), Validators.maxLength(18)]));
    this.rememberMeControl = new Control(false);

    this.form = new ControlGroup({'email': emailControl, 'password': passwordControl, 'rememberMe': rememberMeControl});
  }

  void _onStateChange(State state) {
    isInvalidCredentialsError = state['errorCode'] == 7777;

    if (!isInvalidCredentialsError) {
      form.controls.forEach((String name, AbstractControl control) {
        (control as Control).updateValue('');
        control.setErrors(null);
      });
    }
  }

  void login() {
    if (!form.valid) return;

    _store.dispatch(AuthActionCreator.requestLogin({
      'user': emailControl.value,
      'password': passwordControl.value,
      'rememberMe': rememberMeControl.value,
    }));

    _store.take(1).listen(_onStateChange);
  }
}
