import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:angular2/router.dart';
import 'package:angular2_rbi/directives.dart' show MaterialButton, MaterialCheckbox, MaterialTextfield;

import 'package:SmartPeopleUI/shared/index.dart';
import 'package:SmartPeopleUI/account-management/index.dart';
import 'package:SmartPeopleUI/shared/components/controls/index.dart';
import 'package:SmartPeopleUI/redux/index.dart' show State;

@Component(
    selector: 'sp-login',
    directives: const [
      ROUTER_DIRECTIVES,
      ErrorTooltipComponent,
      InputComponent,
      CheckboxComponent,
      LinkComponent,
      CardComponent,
      ButtonComponent
    ],
    templateUrl: 'login.component.html',
    encapsulation: ViewEncapsulation.Emulated,
    styleUrls: const ['login.component.css'])
class LoginComponent extends FormComponent {

  ControlGroup form;
  Control emailControl;
  Control passwordControl;
  Control rememberMeControl;

  bool areCredentialsValid = null;
  String errorMessage = null;

  final InjectableStore _store;

  LoginComponent(this._store) {
    this.emailControl = new Control('test@test.con', Validators.compose([EmailValidator.validate, Validators.required]));
    this.passwordControl = new Control('777777',
          Validators.compose([
            PasswordValidator.validate,
            Validators.required,
            Validators.minLength(6),
            Validators.maxLength(18)
          ]));
    this.rememberMeControl = new Control(false);

    this.form = new ControlGroup({
      'email': emailControl,
      'password': passwordControl,
      'rememberMe': rememberMeControl
    });
  }

  _onStateChange(State state) {
     areCredentialsValid = state['isAuthenticated'];
     errorMessage = state['errorMessage'];
  }

  login() {
    if (!form.valid) return;

    _store.dispatch(AuthActionCreator.requestLogin({
      'user': emailControl.value,
      'password': passwordControl.value,
      'rememberMe': rememberMeControl.value,
    }));

     _store.take(1).listen(_onStateChange);
  }
}
