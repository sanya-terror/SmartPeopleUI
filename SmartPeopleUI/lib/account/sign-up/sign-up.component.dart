import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'directives/index.dart';
import 'package:SmartPeopleUI/shared/directives/index.dart';

@Component(
    selector: 'sign-up',
    directives: const [
       ROUTER_DIRECTIVES,
       EmailValidatorDirective,
       PasswordValidatorDirective,
       NameValidatorDirective
    ],
    styleUrls: const ['sign-up.component.css'],
    templateUrl: 'sign-up.component.html')

class SignUpComponent {
   String email;
   String password1;
   String password2;
   String name;
   String surname;
}
