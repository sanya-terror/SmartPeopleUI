import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:angular2/router.dart';

import 'package:angular2_material/src/components/button/button.dart';
import 'package:SmartPeopleUI/shared/index.dart';

@Component(
    selector: 'change-password',
    directives: const [
       ROUTER_DIRECTIVES,
       ValidationNotificationComponent,
       MdButton,
       InfoComponent
    ],
    templateUrl: 'change-password.component.html',
    encapsulation: ViewEncapsulation.Native, //TODO it is temporary, in further should remove and avoid
    styleUrls: const['change-password.component.css'])

class ChangePasswordComponent {
   ControlGroup form;
   Map<String, String> messages;

   isValid(String control) => form.controls[control].untouched  || form.controls[control].valid;

   ChangePasswordComponent() {

      this.form = new ControlGroup({
         'password': new Control('', Validators.compose([PasswordValidator.validate, Validators.required])),
         'passwordRepeat': new Control('', Validators.compose([PasswordValidator.validate, Validators.required])),
      });

      this.messages = {
         'password': 'Password is required',
         'passwordRepeat': 'Password is required'
      };

   }
}