import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'index.dart'
    show
        AuthActionCreator,
        ButtonComponent,
        DrawerComponent,
        Link,
        LoginComponent,
        MainComponent,
        NotFoundErrorComponent,
        RestoreAccessComponent,
        SignUpComponent,
        State,
        ForbiddenErrorComponent,
        UnhandledErrorComponent,
        UnauthorizedErrorComponent;

import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart' show InjectableStore;

import 'package:SmartPeopleUI/shared/components/controls/dialog/dialog-manager.dart' show DialogManager;

@Component(
    selector: 'sp-app',
    directives: const [
      ROUTER_DIRECTIVES,
      ButtonComponent,
      DrawerComponent,
      ForbiddenErrorComponent,
      MainComponent,
      UnauthorizedErrorComponent,
      UnhandledErrorComponent
    ],
    providers: const [InjectableStore, DialogManager],
    templateUrl: 'app.component.html',
    styleUrls: const ['app.component.css'])
@RouteConfig(const [
  const Route(path: '/', name: 'Home', component: SignUpComponent, useAsDefault: true),
  const Route(path: '/account/login', name: 'Login', component: LoginComponent),
  const Route(path: '/account/restore-access', name: 'RestoreAccess', component: RestoreAccessComponent),
  const Route(path: '/not-found', name: 'NotFoundPage', component: NotFoundErrorComponent),
  const Route(path: '/account/sign-up', name: 'SignUp', component: SignUpComponent)
])
class AppComponent implements OnInit {
  @ViewChild(UnauthorizedErrorComponent)
  UnauthorizedErrorComponent unauthorizedDialog;

  final InjectableStore _store;
  final Router _router;
  bool isAuthenticated = false;

  List<Link> drawerLinks = [
    new Link('Login', ['Login']),
    new Link('Restore Access', ['RestoreAccess']),
    new Link('Sign Up', ['SignUp']),
    new Link('NotFoundPage', ['NotFoundPage'])
  ];

  AppComponent(this._store, this._router);

  @override
  void ngOnInit() {
    _store.listen(_onStateChanged);
    _store.dispatch(AuthActionCreator.checkLogin());
  }

  void _onStateChanged(State state) {
    var isResourceNotFoundError = state['isResourceNotFoundError'] == null ? false : state['isResourceNotFoundError'];
    if (isResourceNotFoundError) {
      _router.navigate(['NotFoundPage']);
      return;
    }

    var isAuthenticated = state['isAuthenticated'];
    if (isAuthenticated == null || this.isAuthenticated == isAuthenticated) return;

    this.isAuthenticated = isAuthenticated;
  }
}
