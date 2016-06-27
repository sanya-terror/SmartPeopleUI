import 'package:angular2/core.dart' show Component, ViewEncapsulation, OnInit, OnDestroy;
import 'package:angular2/router.dart' show ROUTER_DIRECTIVES;
import 'package:SmartPeopleUI/index.dart'
    show LinkComponent, CardComponent, InjectableStore, SignUpData, SignUpActionCreator;

import 'index.dart' show SignUpCodeComponent, SignUpFormComponent;

@Component(
    selector: 'sign-up',
    directives: const [
       ROUTER_DIRECTIVES,
       SignUpFormComponent,
       SignUpCodeComponent,
       LinkComponent,
       CardComponent
    ],
    styleUrls: const ['sign-up.component.css'],
    encapsulation: ViewEncapsulation.None,
    templateUrl: 'sign-up.component.html')

class SignUpComponent implements OnInit, OnDestroy {

   bool isFormSent = false;

   final InjectableStore _store;

   SignUpComponent(this._store);

   ngOnInit() {
      _store
          .map((state) => state['signUp'])
          .where((data) => data != null)
          .listen(_onStateChange);
   }

   _onStateChange(SignUpData signUp) {
      isFormSent = signUp.signUpToken != null;
   }

   setDefault() => _store.dispatch(SignUpActionCreator.clearSignUp());

   @override
   ngOnDestroy() => setDefault();
}