import 'dart:async' show Future;

import 'package:angular2/core.dart' show Component, OnInit, ViewChild;

import 'package:smartpeople_client/shared/services/injectable-store.service.dart' show InjectableStore;
import 'package:smartpeople_client/index.dart' show ApiActionCreator, DialogAction;
import 'package:smartpeople_client/shared/components/controls/dialog/dialog.component.dart' show DialogComponent;
import 'package:smartpeople_client/redux/index.dart' show State;

@Component(
    selector: 'sp-unhandled-error',
    templateUrl: 'unhandled-error.component.html',
    directives: const [DialogComponent],
    styleUrls: const ['unhandled-error.component.css'])
class UnhandledErrorComponent implements OnInit {
  @ViewChild(DialogComponent)
  DialogComponent dialog;

  bool isErrorShown = false;
  bool isStackTraceShown = false;

  bool _isShown = false;

  final InjectableStore _store;

  List<DialogAction> dialogActions = [];
  String error;
  StackTrace stackTrace;

  UnhandledErrorComponent(this._store);

  @override
  void ngOnInit() {
    dialogActions.add(new DialogAction('Close', _onCloseClick));
    _store
        .where((state) => state['isBadRequestError'] != null || state['isInternalServerError'] != null)
        .listen(_onUnhandledError);
  }

  void _onUnhandledError(State state) {
    if (_isShown) return;

    var isBadRequest = state['isBadRequestError'] == null ? false : state['isBadRequestError'];
    var isInternalServerError = state['isInternalServerError'] == null ? false : state['isInternalServerError'];
    var isError = isBadRequest || isInternalServerError;

    if (isError) {
      _isShown = true;

      error = state['errorMessage'];
      stackTrace = state['errorStackTrace'];
      dialog.showModal();
    }
  }

  void _onCloseClick() {
    dialog.close();
  }

  void showError(isShown) {
    isErrorShown = isShown;
  }

  void showStackTrace(isShown) {
    isStackTraceShown = isShown;
  }

  Future onClose() async {
    await _store.dispatch(ApiActionCreator.badRequestErrorCleanAction());
    await _store.dispatch(ApiActionCreator.internalServerErrorCleanAction());

    _isShown = false;
  }
}
