import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:angular2_material/src/components/button/button.dart';
import 'package:SmartPeopleUI/shared/index.dart';

import 'package:SmartPeopleUI/shared/directives/index.dart';

@Component(
    selector: 'change-password',
    directives: const [
       ROUTER_DIRECTIVES,
       EmailValidatorDirective,
       PasswordValidatorDirective,
       MdAnchor,
       InfoComponent
    ],
    templateUrl: 'error-authorization.component.html',
    styleUrls: const['error-authorization.component.css'])

class ErrorAuthorizationComponent {
   String email;
   String password;
}