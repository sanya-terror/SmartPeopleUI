import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'index.dart';

@Component(
    selector: 'sp-app',
    directives: const [
      ROUTER_DIRECTIVES,
      HeaderComponent,
      FooterComponent,
      LoginComponent
    ],
    providers: const [InjectableStore],
    templateUrl: 'app.component.html',
    styleUrls: const ['app.component.css'])
@RouteConfig(const [
  const Route(
      path: '/', name: 'Home', component: SignUpComponent, useAsDefault: true),
  const Route(
      path: '/account/restore-access',
      name: 'RestoreAccess',
      component: RestoreAccessComponent),
  const Route(
      path: '/account/change-password',
      name: 'ChangePassword',
      component: ChangePasswordComponent),
  const Route(
      path: '/account/error-authorization',
      name: 'ErrorAuthorization',
      component: ErrorAuthorizationComponent)
])
class AppComponent {

  final InjectableStore _store;
  bool isAuthenticated = false;

  AppComponent(this._store){
    _store.listen(_onStateChanged);
    _store.dispatch(AuthActionCreator.checkLogin());
  }

  void _onStateChanged(State state) {

    var isAuthenticated = state['isAuthenticated'];
    if(isAuthenticated == null || this.isAuthenticated == isAuthenticated) return;

    this.isAuthenticated = isAuthenticated;
  }
}
