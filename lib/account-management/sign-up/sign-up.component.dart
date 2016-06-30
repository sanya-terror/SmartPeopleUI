import 'package:angular2/core.dart' show Component, ViewEncapsulation, OnInit, OnDestroy;
import 'package:angular2/router.dart' show ROUTER_DIRECTIVES;
import 'package:SmartPeopleUI/index.dart'
    show LinkComponent, CardComponent, SignUpData, SignUpActionCreator, SharedActionCreator, SignUpCodeComponent, SignUpFormComponent;

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
      isFormSent = signUp?.errorCode != 3333;
      isConfirmationCodeResent = _store.state['isConfirmCodeResend'] != null;
   }

   resendCode() async {
      await _store.dispatch(SharedActionCreator.resendConfirmCode(true));
   }

   setDefault() => _store.dispatch(SignUpActionCreator.clearSignUp());

   @override
   ngOnDestroy() => setDefault();
}