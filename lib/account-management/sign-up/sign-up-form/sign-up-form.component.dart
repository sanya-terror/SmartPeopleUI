import 'package:angular2/angular2.dart'
    show Component, OnInit, Control, ControlGroup, Validators;

//import 'package:SmartPeopleUI/redux/index.dart' show State;

import 'package:SmartPeopleUI/index.dart'
    show InputComponent, ButtonComponent, RadioButtonComponent, FormComponent,
    NameValidator, EmailValidator, PasswordValidator,
    SharedActionCreator, SignUpActionCreator, SignUpData;

import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart';

@Component(
    selector: 'sp-sign-up-form',
    directives: const [
       InputComponent,
       ButtonComponent,
       RadioButtonComponent
    ],
    templateUrl: 'sign-up-form.component.html',
    styleUrls: const ['sign-up-form.component.css']
)

class SignUpFormComponent extends FormComponent implements OnInit {

   final InjectableStore _store;

   ControlGroup form;
   Control nameControl;
   Control surnameControl;
   Control emailControl;
   Control passwordControl;
   Control passwordRepeatControl;
   Control sexControl;

   bool isUserAlreadyExists = false;

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
      this.sexControl = new Control('male');

      this.form = new ControlGroup({
         'name': this.nameControl,
         'surname': this.surnameControl,
         'email': this.emailControl,
         'password': this.passwordControl,
         'passwordRepeat': this.passwordRepeatControl,
         'sex': this.sexControl
      });
   }

   ngOnInit() {
      _store
          .map((state) => state['signUp'])
          .where((data)=>data!=null).take(1)
          .listen(_onStateChange);
   }

   _onStateChange(SignUpData data) {
      isUserAlreadyExists = data?.errorCode == 3333;
   }

   sendForm() async {
      if (!form.valid) return;

      await _store.dispatch(SignUpActionCreator.sendSignUpData({
         'name': nameControl.value,
         'surname': surnameControl.value,
         'user': emailControl.value,
         'password': passwordControl.value,
         'sex': sexControl.value
      }));

      _store.dispatch(SharedActionCreator.saveEmail(emailControl.value));
      _store.dispatch(SignUpActionCreator.savePassword(passwordControl.value));
   }
}
