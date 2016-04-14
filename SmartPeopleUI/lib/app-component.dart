import 'package:angular2/core.dart';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'package:SmartPeopleUI/header/login-component.dart';
import 'package:SmartPeopleUI/footer/footer-component.dart';
import 'package:SmartPeopleUI/system-control-room/sign-up/sign-up-component.dart';
import 'package:SmartPeopleUI/system-control-room/restore-access/restore-access-component.dart';

@Component(
    selector: 'my-app',
    directives: const [LoginComponent, FooterComponent, ROUTER_DIRECTIVES],
    styleUrls: const ['app.css'],
    encapsulation: ViewEncapsulation.None,
    templateUrl: 'app-view.html')

@RouteConfig(const [
   const Route(
       path: '/signup',
       name: 'SignUp',
       component: SignUpComponent,
       useAsDefault: true),
   const Route(path: '/restore', name: 'RestoreAccess', component: RestoreAccessComponent)
])

class AppComponent {}