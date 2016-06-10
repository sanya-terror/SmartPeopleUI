import 'package:angular2/angular2.dart'
   show Component, Control, ControlGroup, OnInit, Validators;
import 'package:SmartPeopleUI/index.dart'
   show EmailValidator, FormComponent, InjectableStore, RestoreAccessActionCreator, RestoreAccessData, State;

import 'package:SmartPeopleUI/redux/index.dart' show State;

@Component(
selector: 'sp-restore-access-email',
templateUrl: 'restore-access-email.component.html')
class RestoreAccessEmailComponent extends FormComponent implements OnInit {

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

   ngOnInit() {
      _store.listen(_onStateChange);
      _onStateChange(_store.state);
   }

   _onStateChange(State state){

      RestoreAccessData restoreAccess = state['restoreAccess'];
      if (restoreAccess == null) return;

      isUserNotFound = restoreAccess.isUserNotFound;
      isInvalidCode = restoreAccess.isInvalidCode;
   }

   getCode() => _store.dispatch(RestoreAccessActionCreator.getRestoreCode(emailControl.value));
}
