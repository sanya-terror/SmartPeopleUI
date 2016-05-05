import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'footer/index.dart';
import 'welcome/welcome-component.dart';
import 'user-cr/user-cr-component.dart';
import 'package:SmartPeopleUI/header/index.dart';

@Component(
    selector: 'sp-app',
    directives: const [ROUTER_DIRECTIVES, HeaderComponent, FooterComponent],

    templateUrl: 'app.component.html',
    styleUrls: const ['app.component.css']
)

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