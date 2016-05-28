import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:angular2/router.dart';

import 'package:angular2_material/src/components/button/button.dart';
import 'package:angular2_material/src/components/checkbox/checkbox.dart';

import 'package:SmartPeopleUI/shared/validators/index.dart';

@Component(
    selector: 'sp-login',
    directives: const [
       ROUTER_DIRECTIVES,
       ValidationNotificationComponent,
       MdButton,
       MdCheckbox
    ],
    templateUrl: 'login.component.html',
    encapsulation: ViewEncapsulation.Native, //TODO it is temporary, in further should remove and avoid
    styleUrls: const ['login.component.css'])

class LoginComponent{

   ControlGroup form;

   isValid(NgControlName control) => control.untouched|| control.valid;

   isRequired(NgControlName control) => !isValid(control) && control.value.length == 0;

   isInsufficientLength(NgControlName control) => !isValid(control) && !isRequired(control) && control.value.length < 6;

   isLengthExcess(NgControlName control) => !isValid(control) && control.value.length > 18;

   isUnhandledError(NgControlName control) {

      if(control.name == 'email') return !isValid(control) && !isRequired(control);

      return !isValid(control) && !isRequired(control) && !isLengthExcess(control) && !isInsufficientLength(control);
   }

   LoginComponent() {

      this.form = new ControlGroup({
         'email': new Control('', Validators.compose([EmailValidator.validate, Validators.required])),
         'password': new Control('', Validators.compose([PasswordValidator.validate, Validators.required]))
      });

   }
}
