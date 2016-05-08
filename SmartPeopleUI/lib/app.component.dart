import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'shared/index.dart';
import 'account/index.dart';
import 'user-cr/user-cr-component.dart';

@Component(
    selector: 'sp-app',
    directives: const [ROUTER_DIRECTIVES, HeaderComponent, FooterComponent],

    templateUrl: 'app.component.html',
    styleUrls: const ['app.component.css']
)

@RouteConfig(const [
//   const Route(
//       path: '/...',
//       name: 'Home',
//       //TODO: set correct Home component
//       component: RestoreAccessComponent,
//       useAsDefault: true),
   const Route(
       path: '/user-cr/...',
       name: 'UserCr',
       component: UserCrComponent),
   const Route(
       path: '/account/restore-access',
       name: 'RestoreAccess',
       component: RestoreAccessComponent),
   const Route(
       path: '/account/change-password',
       name: 'ChangePassword',
       component: ChangePasswordComponent)

])

class AppComponent {}