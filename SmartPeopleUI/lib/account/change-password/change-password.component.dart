import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:angular2_material/src/components/button/button.dart';
import 'package:SmartPeopleUI/shared/index.dart';

import 'package:SmartPeopleUI/shared/directives/index.dart';

@Component(
    selector: 'change-password',
    directives: const [
       ROUTER_DIRECTIVES,
       PasswordValidatorDirective,
       MdAnchor,
       InfoComponent
    ],
    templateUrl: 'change-password.component.html',
    styleUrls: const['change-password.component.css'])

class ChangePasswordComponent {
   String password1;
   String password2;
}