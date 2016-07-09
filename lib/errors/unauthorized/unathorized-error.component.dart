import 'package:angular2/core.dart' show Component, OnInit, ViewChild;
import 'package:angular2/router.dart' show Router;

import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart' show InjectableStore;
import 'package:SmartPeopleUI/index.dart' show ApiActionCreator, DialogAction;
import 'package:SmartPeopleUI/shared/components/controls/dialog/dialog.component.dart';

@Component(
selector: 'sp-unauthorized-error',
templateUrl: 'unathorized-error.component.html',
directives: const[DialogComponent])
class UnauthorizedErrorComponent implements OnInit{

  @ViewChild(DialogComponent)
  DialogComponent dialog;

  final InjectableStore _store;
  final Router _router;

  List<DialogAction> dialogActions = [];

  UnauthorizedErrorComponent(this._store, this._router);

  @override
  ngOnInit() {
    dialogActions.add(new DialogAction('Sign in', _onSignInClick));
  }

  _onSignInClick() {
    _store.dispatch(ApiActionCreator.unauthorizedCleanAction());
    _router.navigate(['Login']);
    dialog.close();
  }

  show(){
    dialog.showModal();
  }
}
