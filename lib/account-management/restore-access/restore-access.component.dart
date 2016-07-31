import 'dart:async' show Future;

import 'package:angular2/core.dart' show Component, OnDestroy, OnInit, ViewEncapsulation;

import 'package:SmartPeopleUI/index.dart'
    show
        ChangePasswordComponent,
        CardComponent,
        RestoreAccessActionCreator,
        RestoreAccessCodeComponent,
        RestoreAccessData,
        RestoreAccessEmailComponent;

import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart';

@Component(
    selector: 'sp-restore-access',
    directives: const [RestoreAccessEmailComponent, RestoreAccessCodeComponent, ChangePasswordComponent, CardComponent],
    encapsulation: ViewEncapsulation.None,
    templateUrl: 'restore-access.component.html',
    styleUrls: const ['restore-access.component.css'])
class RestoreAccessComponent implements OnInit, OnDestroy {
  bool isCodeSent = false;
  bool isCodeApplied = false;

  final InjectableStore _store;

  RestoreAccessComponent(this._store);

  void ngOnInit() {
    _store.map((state) => state['restoreAccess']).where((data) => data != null).listen(_onStateChange);
  }

  void _onStateChange(RestoreAccessData restoreAccess) {
    isCodeSent = restoreAccess.isCodeSent;
    isCodeApplied = restoreAccess.changePasswordToken != null;
  }

  Future setDefault() => _store.dispatch(RestoreAccessActionCreator.clearRestoreAccess());

  @override
  Future ngOnDestroy() => setDefault();
}
