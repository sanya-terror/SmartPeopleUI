import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:angular2_material/src/components/button/button.dart';
import 'package:angular2_material/src/components/checkbox/checkbox.dart';

@Component(
  selector: 'sp-login',
  directives: const [
    ROUTER_DIRECTIVES,
    MdButton,
    MdCheckbox
  ],
  templateUrl: 'login.component.html',
  styleUrls: const ['login.component.css'])

class LoginComponent {}
