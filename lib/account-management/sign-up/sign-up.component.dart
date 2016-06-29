import 'package:angular2/core.dart' show Component, ViewEncapsulation, OnInit, OnDestroy;
import 'package:angular2/router.dart' show ROUTER_DIRECTIVES;
import 'package:SmartPeopleUI/index.dart'
    show LinkComponent, CardComponent, SignUpData, SignUpActionCreator, SignUpCodeComponent, SignUpFormComponent;

import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart';

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
    templateUrl: 'sign-up.component.html')

class SignUpComponent implements OnInit, OnDestroy {

   bool isFormSent = false;
   bool isConfirmationCodeResent = false;

   final InjectableStore _store;

   SignUpComponent(this._store);

   ngOnInit() {
      _store
          .map((state) => state['signUp'])
          .where((data) => data != null)
          .listen(_onStateChange);
   }

   _onStateChange(SignUpData signUp) {
      isFormSent = signUp.isFormSent;
      isConfirmationCodeResent = signUp.restoreCodeKey == 200;
   }

   resendCode() async {
      String email = _store.state['email'];
      int resendCodeKey = 200;

      await _store.dispatch(SignUpActionCreator.sendSignUpForm({
         'user': email,
         'key': resendCodeKey
      }));
   }

   setDefault() => _store.dispatch(SignUpActionCreator.clearSignUp());

   @override
   ngOnDestroy() => setDefault();
}