import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:SmartPeopleUI/header/login/login.component.dart';

@Component(
  selector: 'sp-header',
  directives: const [
    ROUTER_DIRECTIVES,
    LoginComponent
  ],
  templateUrl: 'header.component.html')
class HeaderComponent {}

