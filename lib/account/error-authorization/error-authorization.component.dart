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
       MdAnchor,
       InfoComponent
    ],
    encapsulation: ViewEncapsulation.Native, //TODO it is temporary, in further should remove and avoid
    templateUrl: 'error-authorization.component.html',
    styleUrls: const['error-authorization.component.css'])

class ErrorAuthorizationComponent {
   ControlGroup form;
   Map<String, String> messages;

   isValid(String control) => form.controls[control].untouched  || form.controls[control].valid;

   ErrorAuthorizationComponent() {

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