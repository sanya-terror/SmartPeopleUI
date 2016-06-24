import 'package:angular2/angular2.dart'
    show
    Component,
    Control,
    ControlGroup,
    Validators;

import 'package:SmartPeopleUI/index.dart'
    show
    FormComponent,
    InjectableStore,
    RestoreAccessActionCreator,
    RestoreCodeValidator,
    InputComponent,
    ButtonComponent;

@Component(
    selector: 'sp-restore-access-code',
    directives: const [InputComponent, ButtonComponent],
    templateUrl: 'restore-access-code.component.html')

class RestoreAccessCodeComponent extends FormComponent{

   final InjectableStore _store;

   Control codeControl;

   ControlGroup form;

   RestoreAccessCodeComponent(this._store) {
      this.codeControl = new Control('12345678', Validators.compose([RestoreCodeValidator.validate, Validators.required]));
      this.form = new ControlGroup({ 'code': this.codeControl});
   }

   applyCode() {
      if (!form.valid) return;

      _store.dispatch(RestoreAccessActionCreator.applyRestoreCode(codeControl.value));
   }
}
