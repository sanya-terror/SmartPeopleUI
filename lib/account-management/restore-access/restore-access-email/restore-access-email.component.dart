import 'dart:async' show Future, StreamSubscription;

import 'package:angular2/angular2.dart' show Component, Control, ControlGroup, Validators;

import 'package:SmartPeopleUI/index.dart'
    show
        EmailValidator,
        FormComponent,
        RestoreAccessActionCreator,
        RestoreAccessData,
        InputComponent,
        ButtonComponent,
        SharedActionCreator;

import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart' show InjectableStore;

@Component(
    selector: 'sp-restore-access-email',
    directives: const [InputComponent, ButtonComponent],
    templateUrl: 'restore-access-email.component.html')
class RestoreAccessEmailComponent extends FormComponent {
  final InjectableStore _store;

  bool isUserNotFound = false;

  Control emailControl;
  ControlGroup form;

  RestoreAccessEmailComponent(this._store) {
    this.emailControl = new Control('', Validators.compose([EmailValidator.validate, Validators.required]));

    this.form = new ControlGroup({'email': this.emailControl});
  }

  void _onStateChange(RestoreAccessData data) {
    isUserNotFound = data.errorCode == 1111;
  }

  Future getCode() async {
    if (!form.valid) return;

    String email = emailControl.value;

    _store.dispatch(SharedActionCreator.saveEmail(email));
    _store.dispatch(RestoreAccessActionCreator.getRestoreCode(email));

    _subscribeOnceForRestoreAccessData();
  }

  StreamSubscription _subscribeOnceForRestoreAccessData() =>
      _store.map((state) => state['restoreAccess']).where((data) => data != null).take(1).listen(_onStateChange);
}
