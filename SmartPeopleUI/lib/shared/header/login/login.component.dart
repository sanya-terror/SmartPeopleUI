import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:angular2_material/src/components/button/button.dart';
import 'package:angular2_material/src/components/checkbox/checkbox.dart';

import 'package:SmartPeopleUI/shared/directives/index.dart';

@Component(
    selector: 'sp-login',
    directives: const [
       ROUTER_DIRECTIVES,
       EmailValidatorDirective,
       PasswordValidatorDirective,
       MdButton,
       MdCheckbox
    ],
    templateUrl: 'login.component.html',
    encapsulation: ViewEncapsulation.Native,
    styleUrls: const ['login.component.css'])

class LoginComponent {
  String email;
  String password;
}
