import 'package:angular2/core.dart' show Component, OnInit, ViewChild;
import 'package:angular2/router.dart' show Router;

import 'package:smartpeople_client/shared/services/injectable-store.service.dart' show InjectableStore;
import 'package:smartpeople_client/index.dart' show ApiActionCreator, DialogAction;
import 'package:smartpeople_client/shared/components/controls/dialog/dialog.component.dart' show DialogComponent;
import 'package:smartpeople_client/redux/index.dart' show State;

@Component(
    selector: 'sp-forbidden-error', templateUrl: 'forbidden-error.component.html', directives: const [DialogComponent])
class ForbiddenErrorComponent implements OnInit {
  @ViewChild(DialogComponent)
  DialogComponent dialog;

  final InjectableStore _store;
  final Router _router;

  bool _isShown = false;

  List<DialogAction> dialogActions = [];

  ForbiddenErrorComponent(this._store, this._router);

  @override
  void ngOnInit() {
    dialogActions.add(new DialogAction('Sign in', _onSignInClick));
    dialogActions.add(new DialogAction('Close', _onCloseClick));

    _store.where((state) => state['isForbiddenError'] != null).listen(_onForbiddenError);
  }

  void _onForbiddenError(State state) {
    if (_isShown || !state['isForbiddenError']) return;

    _isShown = true;
    dialog.showModal();
  }

  void _onSignInClick() {
    _router.navigate(['Login']);
    dialog.close();
  }

  void _onCloseClick() {
    dialog.close();
  }

  void onClose() {
    _store.dispatch(ApiActionCreator.forbiddenCleanAction());
    _isShown = false;
  }
}
