import 'dart:async' show Future;
import 'package:angular2/angular2.dart'
    show Component, OnInit, Control, ControlGroup, Validators;

import 'package:SmartPeopleUI/index.dart'
    show
        InputComponent,
        ButtonComponent,
        RadioButtonComponent,
        FormComponent,
        UserNameValidator,
        EmailValidator,
        PasswordValidator,
        SharedActionCreator,
        SignUpActionCreator,
        SignUpData;

import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart' show InjectableStore;

@Component(
    selector: 'sp-sign-up-form',
    directives: const [InputComponent, ButtonComponent, RadioButtonComponent],
    templateUrl: 'sign-up-form.component.html',
    styleUrls: const ['sign-up-form.component.css']
)

class SignUpFormComponent extends FormComponent implements OnInit {
  final InjectableStore _store;

   ControlGroup form;
   Control userNameControl;
   Control emailControl;
   Control passwordControl;
   Control passwordRepeatControl;


  bool isUserAlreadyExists = false;

   SignUpFormComponent(this._store) {
      this.userNameControl = new Control('',
          Validators.compose([UserNameValidator.validate, Validators.required]));
      this.emailControl = new Control('',
          Validators.compose([EmailValidator.validate, Validators.required]));
      this.passwordControl = new Control('',
          Validators.compose([
             PasswordValidator.validate,
             Validators.required,
             Validators.minLength(6),
             Validators.maxLength(18)
          ]));
      this.passwordRepeatControl = new Control('',
          Validators.compose(
              [PasswordValidator.validate, Validators.required]));

      this.form = new ControlGroup({
         'userName': this.userNameControl,
         'email': this.emailControl,
         'password': this.passwordControl,
         'passwordRepeat': this.passwordRepeatControl,
      });
   }

  @override
  void ngOnInit() {
    _store.map((state) => state['signUp']).where((data) => data != null).listen(_onStateChange);
  }

  void _onStateChange(SignUpData data) {
    isUserAlreadyExists = data.errorCode == 3333;
  }

  Future sendForm() async {
    if (!form.valid) return;

      await _store.dispatch(SignUpActionCreator.sendSignUpData({
         'userName': userNameControl.value,
         'user': emailControl.value,
         'password': passwordControl.value,
      }));

    _store.dispatch(SharedActionCreator.saveEmail(emailControl.value));
    _store.dispatch(SignUpActionCreator.savePassword(passwordControl.value));
  }
}
