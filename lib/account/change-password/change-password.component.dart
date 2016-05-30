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

   isValid(NgControlName control) => control.untouched|| control.valid;

   isRequired(NgControlName control) => !isValid(control) && control.value.length == 0;

   isInsufficientLength(NgControlName control) => !isValid(control) && !isRequired(control) && control.value.length < 6;

   isLengthExcess(NgControlName control) => !isValid(control) && control.value.length > 18;

   isNotEqual(NgControlName comparativeControl, NgControlName controlToCompare) => comparativeControl.value != controlToCompare.value;

   isPasswordUnhandledError(NgControlName control) => !isValid(control) && !isRequired(control) && !isLengthExcess(control) && !isInsufficientLength(control);

   ChangePasswordComponent() {

      this.form = new ControlGroup({
         'password': new Control('', Validators.compose([PasswordValidator.validate, Validators.required])),
         'passwordRepeat': new Control('', Validators.compose([PasswordValidator.validate, Validators.required])),
      });

   }
}