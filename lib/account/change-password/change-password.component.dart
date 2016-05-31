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

class ChangePasswordComponent extends FormComponent{
   ControlGroup form;

   ChangePasswordComponent() {

      this.form = new ControlGroup({
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
      });

   }
}