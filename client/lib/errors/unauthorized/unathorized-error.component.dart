import 'package:angular2/core.dart' show Component, OnInit, ViewChild;
import 'package:angular2/router.dart' show Router;

import 'package:smartpeople_client/shared/services/injectable-store.service.dart' show InjectableStore;
import 'package:smartpeople_client/index.dart' show ApiActionCreator, DialogAction;
import 'package:smartpeople_client/shared/components/controls/dialog/dialog.component.dart';
import 'package:smartpeople_client/redux/index.dart';

@Component(
    selector: 'sp-unauthorized-error',
    templateUrl: 'unathorized-error.component.html',
    directives: const [DialogComponent])
class UnauthorizedErrorComponent implements OnInit {
  @ViewChild(DialogComponent)
  DialogComponent dialog;

  final InjectableStore _store;
  final Router _router;

  bool _isShown = false;

  List<DialogAction> dialogActions = [];

  UnauthorizedErrorComponent(this._store, this._router);

  @override
  void ngOnInit() {
    dialogActions.add(new DialogAction('Sign in', _onSignInClick));

    _store.where((state) => state['isUnauthorizedError'] != null).listen(_onUnauthorizedError);
  }

  void _onUnauthorizedError(State state) {
    if (_isShown || !state['isUnauthorizedError']) return;

    _isShown = true;
    dialog.showModal();
  }

  void _onSignInClick() {
    _router.navigate(['Login']);
    dialog.close();
  }

  void onClose() {
    _store.dispatch(ApiActionCreator.unauthorizedCleanAction());
    _isShown = false;
  }
}
