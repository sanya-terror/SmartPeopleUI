import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'login/login.component.dart';

@Component(
  selector: 'sp-header',
  directives: const [
    ROUTER_DIRECTIVES,
    LoginComponent
  ],
  templateUrl: 'header.component.html',
  styleUrls: const ['header.component.css'])
class HeaderComponent {}

