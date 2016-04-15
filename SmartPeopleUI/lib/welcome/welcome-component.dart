import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:SmartPeopleUI/welcome/header/header-component.dart';
import 'package:SmartPeopleUI/welcome/footer/footer-component.dart';
import 'package:SmartPeopleUI/welcome/account-managment/sign-up/sign-up-component.dart';
import 'package:SmartPeopleUI/welcome/account-managment/restore-access/restore-access-component.dart';

@Component(
    selector: 'welcome',
    directives: const [ROUTER_DIRECTIVES, HeaderComponent, FooterComponent],
    templateUrl: 'welcome-view.html')

@RouteConfig(const [
   const Route(
       path: '/signup',
       name: 'SignUp',
       component: SignUpComponent,
       useAsDefault: true),
   const Route(path: '/restore', name: 'RestoreAccess', component: RestoreAccessComponent)
])

class WelcomeComponent {}