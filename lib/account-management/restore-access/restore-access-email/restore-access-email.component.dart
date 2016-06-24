import 'package:angular2/angular2.dart'
   show Component, Control, ControlGroup, OnInit, Validators;
import 'package:SmartPeopleUI/index.dart'
   show EmailValidator, FormComponent, InjectableStore, RestoreAccessActionCreator, RestoreAccessData,
   InputComponent, ButtonComponent;

import 'package:SmartPeopleUI/redux/index.dart' show State;

@Component(
selector: 'sp-restore-access-email',
directives: const[ InputComponent, ButtonComponent ],
templateUrl: 'restore-access-email.component.html')
class RestoreAccessEmailComponent extends FormComponent {

   final InjectableStore _store;

   bool isUserNotFound = false;
   bool isInvalidCode = false;

   Control emailControl;
   ControlGroup form;

   RestoreAccessEmailComponent(this._store) {
      this.emailControl = new Control(
         'test@test.com',
         Validators.compose([EmailValidator.validate, Validators.required]));

      this.form = new ControlGroup({ 'email': this.emailControl});
   }

   _onStateChange(RestoreAccessData data){
      isUserNotFound = data.errorCode == 1111;
   }

   getCode() async {
      if (!form.valid) return;

      _subscribeOnceForRestoreAccessData();

      var email = emailControl.value;
      await _store.dispatch(RestoreAccessActionCreator.saveEmail(email));
      _store.dispatch(RestoreAccessActionCreator.getRestoreCode(email));
   }

   _subscribeOnceForRestoreAccessData() =>
      _store
        .map((state) => state['restoreAccess'])
        .where((data) => data != null)
        .take(1)
        .listen(_onStateChange);
   }
