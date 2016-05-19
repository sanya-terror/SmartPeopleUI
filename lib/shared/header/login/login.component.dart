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
   Object messages;

   isValid(String control) => form.controls[control].untouched  || form.controls[control].valid;

   LoginComponent() {

      this.form = new ControlGroup({
         'email': new Control('', Validators.compose([EmailValidator.validate, Validators.required])),
         'password': new Control('', Validators.compose([PasswordValidator.validate, Validators.required]))
      });

      this.messages = {
         'email': 'Email is required',
         'password': 'Password is required'
      };

   }
}
