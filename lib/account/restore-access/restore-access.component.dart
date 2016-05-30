import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:angular2/router.dart';

import 'package:angular2_material/src/components/button/button.dart';
import 'validators/restore-code.validator.dart';

import 'package:SmartPeopleUI/shared/index.dart';

@Component(
    selector: 'restore-access',
    directives: const [
       ROUTER_DIRECTIVES,
       ValidationNotificationComponent,
       MdButton,
       InfoComponent
    ],
    encapsulation: ViewEncapsulation.Native,//TODO it is temporary, in further should remove and avoid
    templateUrl: 'restore-access.component.html',
    styleUrls: const['restore-access.component.css'])

class RestoreAccessComponent {

   ControlGroup form;

   isValid(NgControlName control) => control.untouched|| control.valid;

   isRequired(NgControlName control) => !isValid(control) && control.value.length == 0;

   isGeneralUnhandledError(NgControlName control) => !isValid(control) && !isRequired(control);

   RestoreAccessComponent() {

      this.form = new ControlGroup({
         'email': new Control('', Validators.compose([EmailValidator.validate, Validators.required])),
         'code': new Control('', Validators.compose([RestoreCodeValidator.validate, Validators.required]))
      });

   }
}