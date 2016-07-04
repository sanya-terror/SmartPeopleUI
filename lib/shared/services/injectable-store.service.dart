import 'dart:html' show window;
import 'package:angular2/core.dart' show Injectable;
import 'package:SmartPeopleUI/shared/services/local-storage.service.dart' show LocalStorageService;
import 'package:SmartPeopleUI/redux/index.dart' show combineReducers, applyMiddleware, Store, State;
import 'package:SmartPeopleUI/index.dart' show AuthReducer, RestoreAccessReducer, SignUpReducer;
import 'package:SmartPeopleUI/shared/middleware/api.middleware.dart' show ApiMiddleware;
import 'package:SmartPeopleUI/shared/middleware/print.middleware.dart' show printMiddleware;
import 'package:SmartPeopleUI/shared/reducers/index.dart' show ApiErrorsReducer, SharedReducer;


@Injectable()
class InjectableStore extends Store {
   InjectableStore(LocalStorageService localStorage) :
          super(combineReducers(
           [
              AuthReducer.reduce,
              ApiErrorsReducer.reduce,
              RestoreAccessReducer.reduce,
              SharedReducer.reduce,
              SignUpReducer.reduce
           ]
       ),
            initialState: new State({}),
            middleware: applyMiddleware(
                [printMiddleware, new ApiMiddleware(localStorage).apply])){

    this.listen((state) => window.console.debug('PRINTER: State changed to: $state'));

  }
}
