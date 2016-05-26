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

   isEmpty(String control) {
      bool isValid = form.controls[control].untouched  || form.controls[control].valid;
      String value = form.controls[control].value;

      return !isValid && value.length == 0;
   }

   isTooShort(String control) {
      bool isValid = form.controls[control].untouched  || form.controls[control].valid;
      String value = form.controls[control].value;

      return !isValid && !isEmpty(control) && value.length < 6;
   }

   isTooLong(String control) {
      bool isValid = form.controls[control].untouched  || form.controls[control].valid;
      String value = form.controls[control].value;

      return !isValid && value.length > 18;
   }

   isIncorrect(String control) {
      bool isValid = form.controls[control].untouched  || form.controls[control].valid;

      if(control == 'email') return !isValid && !isEmpty(control);

      return !isValid && !isEmpty(control) && !isTooLong(control) && !isTooShort(control);
   }

   LoginComponent() {

      this.form = new ControlGroup({
         'email': new Control('', Validators.compose([EmailValidator.validate, Validators.required])),
         'password': new Control('', Validators.compose([PasswordValidator.validate, Validators.required]))
      });

   }
}
