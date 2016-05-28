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

  isValid(NgControlName control) => control.untouched || control.valid;

  isInsufficientLength(NgControlName control) => !isValid(control) && !isRequired(control) && control.value.length < 6;

  isLengthExcess(NgControlName control) => !isValid(control) && control.value.length > 18;

  isNotEqual(NgControlName comparativeControl, NgControlName controlToCompare) => comparativeControl.value != controlToCompare.value;

  isRequired(NgControlName control) => !isValid(control) && control.value.length == 0;

  isUnhandledError(NgControlName control) {

    if(control.name == 'email' || control.name == 'name' || control.name == 'surname') return !isValid(control) && !isRequired(control);

    return !isValid(control) && !isRequired(control) && !isLengthExcess(control) && !isInsufficientLength(control);
  }

  SignUpComponent() {

    this.form = new ControlGroup({
      'name': new Control('', Validators.compose([NameValidator.validate, Validators.required])),
      'surname': new Control('', Validators.compose([NameValidator.validate, Validators.required])),
      'email': new Control('', Validators.compose([EmailValidator.validate, Validators.required])),
      'password': new Control('', Validators.compose([PasswordValidator.validate, Validators.required])),
      'passwordRepeat': new Control('', Validators.compose([PasswordValidator.validate, Validators.required])),
      'gender': new Control('', Validators.required)
    });

  }
}
