import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:angular2/router.dart';

import 'package:SmartPeopleUI/shared/index.dart';
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

class SignUpComponent extends FormComponent{
  ControlGroup form;

  SignUpComponent() {

    this.form = new ControlGroup({
      'name': new Control('', Validators.compose([
         NameValidator.validate,
         Validators.required
      ])),
      'surname': new Control('', Validators.compose([
         NameValidator.validate,
         Validators.required
      ])),
      'email': new Control('', Validators.compose([
         EmailValidator.validate,
         Validators.required
      ])),
      'password': new Control('', Validators.compose([
         PasswordValidator.validate,
         Validators.required,
         Validators.minLength(6),
         Validators.maxLength(18)
      ])),
      'passwordRepeat': new Control('', Validators.compose([
         PasswordValidator.validate,
         Validators.required
      ])),
      'gender': new Control('', Validators.required)
    });

  }
}
