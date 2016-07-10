import 'package:angular2/core.dart' show Component, OnInit, ViewChild;

import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart' show InjectableStore;
import 'package:SmartPeopleUI/index.dart' show ApiActionCreator, DialogAction;
import 'package:SmartPeopleUI/shared/components/controls/dialog/dialog.component.dart' show DialogComponent;
import 'package:SmartPeopleUI/redux/index.dart' show State;

@Component(
selector: 'sp-unhandled-error',
templateUrl: 'unhandled-error.component.html',
directives: const[DialogComponent],
styleUrls: const['unhandled-error.component.css'])
class UnhandledErrorComponent implements OnInit{

  @ViewChild(DialogComponent)
  DialogComponent dialog;

  bool isErrorShown = false;
  bool isStackTraceShown = false;

  final InjectableStore _store;

  List<DialogAction> dialogActions = [];
  String error;
  StackTrace stackTrace;

  UnhandledErrorComponent(this._store);

  @override
  ngOnInit() {
    dialogActions.add(new DialogAction('Close', _onCloseClick));
    _store
      .where((state) => state['isBadRequestError'] != null || state['isInternalServerError'] != null)
      .listen(_onUnhandledError);
  }

  _onUnhandledError(State state){

    var isBadRequest = state['isBadRequestError'] == null ? false : state['isBadRequestError'];
    var isInternalServerError = state['isInternalServerError'] == null ? false : state['isInternalServerError'];
    var isError = isBadRequest || isInternalServerError;

    if (isError){
      error = state['errorMessage'];
      stackTrace = state['errorStackTrace'];
      dialog.showModal();
    }
  }

  _onCloseClick() async {
    await _store.dispatch(ApiActionCreator.badRequestErrorCleanAction());
    await _store.dispatch(ApiActionCreator.internalServerErrorCleanAction());
    dialog.close();
  }

  showError(isShown){
    isErrorShown = isShown;
  }

  showStackTrace(isShown){
    isStackTraceShown = isShown;
  }
}
