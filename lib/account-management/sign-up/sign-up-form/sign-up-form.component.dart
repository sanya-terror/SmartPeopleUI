import 'package:angular2/angular2.dart'
    show Component, OnInit, Control, ControlGroup, Validators;

import 'package:angular2/router.dart' show ROUTER_DIRECTIVES;

import 'package:SmartPeopleUI/redux/index.dart' show State;

import 'package:SmartPeopleUI/index.dart'
    show InputComponent, ButtonComponent, RadioButtonComponent, FormComponent,
    InjectableStore, NameValidator, EmailValidator, PasswordValidator,
    SharedActionCreator, SignUpActionCreator;

@Component(
    selector: 'sp-sign-up-form',
    directives: const [
       ROUTER_DIRECTIVES,
       InputComponent,
       ButtonComponent,
       RadioButtonComponent
    ],
    templateUrl: 'sign-up-form.component.html')
class SignUpFormComponent extends FormComponent implements OnInit {

   final InjectableStore _store;

   ControlGroup form;
   Control nameControl;
   Control surnameControl;
   Control emailControl;
   Control passwordControl;
   Control passwordRepeatControl;
   Control genderControl;

   String sex;

   SignUpFormComponent(this._store) {
      this.nameControl = new Control('Aleksander',
          Validators.compose([NameValidator.validate, Validators.required]));
      this.surnameControl = new Control('Kabanov',
          Validators.compose([NameValidator.validate, Validators.required]));
      this.emailControl = new Control('test@test.com',
          Validators.compose([EmailValidator.validate, Validators.required]));
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
      this.genderControl = new Control('male');

      this.form = new ControlGroup({
         'name': this.nameControl,
         'surname': this.surnameControl,
         'email': this.emailControl,
         'password': this.passwordControl,
         'passwordRepeat': this.passwordRepeatControl,
         'gender': this.genderControl
      });
   }

   ngOnInit() {
      _store.listen(_onStateChange);
      _onStateChange(_store.state);
   }

   _onStateChange(State state) {

   }

   sendForm() async {
      if (!form.valid) return;

      var email = emailControl.value;
      var password = passwordControl.value;

      await _store.dispatch(SharedActionCreator.saveEmail(email));
      await _store.dispatch(SignUpActionCreator.savePassword(password));
      await _store.dispatch(SignUpActionCreator.sendSignUpForm({
         'name': nameControl.value,
         'surname': surnameControl.value,
         'user': emailControl.value,
         'password': passwordControl.value,
         'gender': genderControl.value
      }));
   }
}
