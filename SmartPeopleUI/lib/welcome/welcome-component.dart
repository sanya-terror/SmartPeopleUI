import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'welcome-directives.dart';
import 'account-managment/sign-up/sign-up-component.dart';
import 'account-managment/restore-access/restore-access-component.dart';

@Component(
    selector: 'welcome',
    directives: const [
       ROUTER_DIRECTIVES,
       WELCOME_DIRECTIVES
    ],
    templateUrl: 'welcome-view.html')

@RouteConfig(const [
   const Route(
       path: '/signup',
       name: 'SignUp',
       component: SignUpComponent,
       useAsDefault: true),

   const Route(
       path: '/restore',
       name: 'RestoreAccess',
       component: RestoreAccessComponent)
])

class WelcomeComponent {}