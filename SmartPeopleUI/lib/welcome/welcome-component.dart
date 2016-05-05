import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'account-managment/sign-up/sign-up-component.dart';
import 'account-managment/restore-access/restore-access-component.dart';
import 'account-managment/change-password/change-password-component.dart';

@Component(
    selector: 'welcome',
    directives: const [
       ROUTER_DIRECTIVES,
    ],
    encapsulation: ViewEncapsulation.None,
    templateUrl: 'welcome-view.html')

@RouteConfig(const [
   const Route(
       path: '/signup',
       name: 'SignUp',
       component: SignUpComponent,
       useAsDefault: true),

   const Route(
       path: '/restore-access',
       name: 'RestoreAccess',
       component: RestoreAccessComponent),

   const Route(
       path: '/change-password',
       name: 'ChangePassword',
       component: ChangePasswordComponent)
])

class WelcomeComponent {}