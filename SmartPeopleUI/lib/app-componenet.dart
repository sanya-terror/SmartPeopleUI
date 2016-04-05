import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:SmartPeopleUI/header/login-componenet.dart';
import 'package:SmartPeopleUI/system-control-room/sign-up/sign-up-componenet.dart';
import 'package:SmartPeopleUI/footer/footer-componenet.dart';

@Component(
    selector: 'body',
    directives: const [ROUTER_DIRECTIVES],
    providers: const [ROUTER_PROVIDERS],
    styleUrls: const ['app.css'],
    templateUrl: 'app-view.html')
@RouteConfig(const [
   const Route(
       path: '/login',
       name: 'LoginOrSignUp',
       component: LoginComponent,
       useAsDefault: true),
   const Route(
       path: '/signup', name: 'signup', component: SignUpComponent),
   const Route(path: '/footer', name: 'footer', component: FooterComponent)
])
class AppComponent {
   String title = 'Smart People - is the one scientific social network';
}