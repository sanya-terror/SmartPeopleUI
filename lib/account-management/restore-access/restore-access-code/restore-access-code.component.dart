import 'package:angular2/angular2.dart'
    show Component, Control, ControlGroup, Validators;

import 'package:SmartPeopleUI/index.dart'
    show ButtonComponent, FormComponent, InputComponent,
    RestoreAccessActionCreator, RestoreAccessData, RestoreCodeValidator;

import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart' show InjectableStore;

@Component(
    selector: 'sp-restore-access-code',
    directives: const [InputComponent, ButtonComponent],
    templateUrl: 'restore-access-code.component.html'
)

class RestoreAccessCodeComponent extends FormComponent{

   final InjectableStore _store;

   bool isInvalidCode = false;

   Control codeControl;

   ControlGroup form;

   RestoreAccessCodeComponent(this._store) {
      this.codeControl = new Control('',
          Validators.compose([
             RestoreCodeValidator.validate,
             Validators.required
          ]));

      this.form = new ControlGroup({ 'code': this.codeControl});
   }

   _onStateChange(RestoreAccessData data){
      isInvalidCode = data.errorCode == 2222;
   }

   applyCode() {
      if (!form.valid) return;

      _subscribeOnceForRestoreAccessData();
      _store.dispatch(RestoreAccessActionCreator.applyRestoreCode(codeControl.value));
   }

   _subscribeOnceForRestoreAccessData() =>
       _store
         .map((state) => state['restoreAccess'])
         .where((data) => data != null)
         .take(1)
         .listen(_onStateChange);
}
