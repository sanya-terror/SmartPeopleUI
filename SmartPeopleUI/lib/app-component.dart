import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'welcome/welcome-component.dart';
import 'user-cr/user-cr-component.dart';

@Component(
    selector: 'my-app',
    directives: const [
       ROUTER_DIRECTIVES
    ],
    encapsulation: ViewEncapsulation.None,
    templateUrl: 'app-view.html')

@RouteConfig(const [
   const Route(
       path: '/welcome/...',
       name: 'Welcome',
       component: WelcomeComponent,
       useAsDefault: true),
   const Route(
       path: '/user-cr/...',
       name: 'UserCr',
       component: UserCrComponent)
])

class AppComponent {}