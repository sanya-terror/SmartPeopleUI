import 'package:angular2/core.dart' show Component, OnInit, OnDestroy;
//import 'package:angular2/router.dart' show ROUTER_DIRECTIVES;
import 'package:SmartPeopleUI/index.dart'
    show LinkComponent, CardComponent, SignUpData, SignUpActionCreator, SignUpCodeComponent, SignUpFormComponent;

import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart';

@Component(
    selector: 'sign-up',
    directives: const [

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
   bool isConfirmationCodeResentError = false;

   final InjectableStore _store;

   SignUpComponent(this._store);

   ngOnInit() {
      _store
          .map((state) => state['signUp'])
          .where((data) => data != null)
          .listen(_onStateChange);
   }

   _onStateChange(SignUpData signUp) {
      isFormSent = signUp.errorCode != 3333;
      isConfirmationCodeResent = signUp.isConfirmationCodeResent;
      isConfirmationCodeResentError = signUp.errorCode == 5555;
   }

   resendCode() {
      _store.dispatch(SignUpActionCreator.resendConfirmCode(_store.state['signUp'].signUpToken));
   }

   setDefault() => _store.dispatch(SignUpActionCreator.clearSignUp());

   @override
   ngOnDestroy() => setDefault();
}