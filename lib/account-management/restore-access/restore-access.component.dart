import 'package:angular2/core.dart' show Component, OnDestroy, OnInit, ViewEncapsulation;

import 'package:SmartPeopleUI/index.dart'
  show ChangePasswordComponent, InfoComponent, RestoreAccessActionCreator, RestoreAccessCodeComponent, RestoreAccessData, RestoreAccessEmailComponent;
import 'package:SmartPeopleUI/redux/index.dart' show State;
import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart';

@Component(
    selector: 'sp-restore-access',
    directives: const [
      RestoreAccessEmailComponent,
      RestoreAccessCodeComponent,
      ChangePasswordComponent,
      InfoComponent
    ],
    encapsulation: ViewEncapsulation.Emulated,
    templateUrl: 'restore-access.component.html',
    styleUrls: const ['restore-access.component.css'])
class RestoreAccessComponent implements OnInit, OnDestroy {

  bool isCodeSent = false;
  bool isCodeApplied = false;

  final InjectableStore _store;

  RestoreAccessComponent(this._store);

  ngOnInit() {
    _store.listen(_onStateChange);
  }

  _onStateChange(State state){

    RestoreAccessData restoreAccess = state['restoreAccess'];
    if (restoreAccess == null) return;

    isCodeSent = restoreAccess.isCodeSent;
    isCodeApplied = restoreAccess.isCodeApplied;
  }

  setDefault() => _store.dispatch(RestoreAccessActionCreator.clearRestoreAccess());

  @override
  ngOnDestroy() => setDefault();
}
