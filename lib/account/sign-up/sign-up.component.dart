import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:angular2/router.dart';

import 'package:SmartPeopleUI/shared/validators/index.dart';
import 'index.dart';

@Component(
    selector: 'sign-up',
    directives: const [
      ROUTER_DIRECTIVES,
      ValidationNotificationComponent
    ],
    styleUrls: const ['sign-up.component.css'],
    encapsulation: ViewEncapsulation.Native,//TODO it is temporary, in further should remove and avoid
    templateUrl: 'sign-up.component.html')

class SignUpComponent{

  ControlGroup form;
  Map<String, String> messages;

  isValid(String control) => form.controls[control].untouched  || form.controls[control].valid;

  SignUpComponent() {
    this.form = new ControlGroup({
      'name': new Control('', Validators.compose([NameValidator.validate, Validators.required])),
      'surname': new Control('', Validators.compose([NameValidator.validate, Validators.required])),
      'email': new Control('', Validators.compose([EmailValidator.validate, Validators.required])),
      'password': new Control('', Validators.compose([PasswordValidator.validate, Validators.required])),
      'passwordRepeat': new Control('', Validators.compose([PasswordValidator.validate, Validators.required])),
      'gender': new Control('', Validators.required)
    });

    this.messages = {
      'name': 'Name is required',
      'surname': 'Surname is required',
      'email': 'Email is required',
      'password': 'Password is required',
      'passwordRepeat': 'Password is required',
      'gender': 'Gender is required',
    };
  }
}
