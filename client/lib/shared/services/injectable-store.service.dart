import 'dart:html' show window;
import 'package:angular2/core.dart' show Injectable;
import 'package:smartpeople_client/shared/services/index.dart' show LocalStorageService, SessionStorageService;
import 'package:smartpeople_client/redux/index.dart' show combineReducers, applyMiddleware, Store, State;
import 'package:smartpeople_client/index.dart' show AuthReducer, RestoreAccessReducer, SignUpReducer;
import 'package:smartpeople_client/shared/middleware/api.middleware.dart' show ApiMiddleware;
import 'package:smartpeople_client/shared/middleware/print.middleware.dart' show printMiddleware;
import 'package:smartpeople_client/shared/reducers/index.dart' show ApiErrorsReducer, SharedReducer;

@Injectable()
class InjectableStore extends Store {
  InjectableStore(LocalStorageService localStorage, SessionStorageService sessionStorage)
      : super(
            combineReducers([
              AuthReducer.reduce,
              ApiErrorsReducer.reduce,
              RestoreAccessReducer.reduce,
              SharedReducer.reduce,
              SignUpReducer.reduce
            ]),
            initialState: new State({}),
            middleware: applyMiddleware([printMiddleware, new ApiMiddleware(localStorage, sessionStorage).apply])) {
    this.listen((state) => window.console.debug('PRINTER: State changed to: $state'));
  }
}
