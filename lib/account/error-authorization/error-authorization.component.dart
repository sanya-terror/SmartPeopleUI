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
    encapsulation: ViewEncapsulation.Native, //TODO it is temporary, in further should remove and avoid
    templateUrl: 'error-authorization.component.html',
    styleUrls: const['error-authorization.component.css'])

class ErrorAuthorizationComponent {
   ControlGroup form;

   isValid(NgControlName control) => control.untouched|| control.valid;

   isRequired(NgControlName control) => !isValid(control) && control.value.length == 0;

   isInsufficientLength(NgControlName control) => !isValid(control) && !isRequired(control) && control.value.length < 6;

   isLengthExcess(NgControlName control) => !isValid(control) && control.value.length > 18;

   isUnhandledError(NgControlName control) {

      if(control.name == 'email') return !isValid(control) && !isRequired(control);

      return !isValid(control) && !isRequired(control) && !isLengthExcess(control) && !isInsufficientLength(control);
   }

   ErrorAuthorizationComponent() {

      this.form = new ControlGroup({
         'email': new Control('', Validators.compose([EmailValidator.validate, Validators.required])),
         'password': new Control('', Validators.compose([PasswordValidator.validate, Validators.required]))
      });

   }
}