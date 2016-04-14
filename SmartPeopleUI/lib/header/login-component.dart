import 'package:angular2/core.dart';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

@Component(
    selector: 'header',
    directives: const [ROUTER_DIRECTIVES],
    styleUrls: const ['login.css'],
    templateUrl: 'login-view.html')
class LoginComponent {}