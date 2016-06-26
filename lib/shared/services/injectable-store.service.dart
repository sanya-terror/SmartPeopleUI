import 'package:angular2/core.dart' show Injectable;
import 'package:SmartPeopleUI/shared/services/local-storage.service.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/index.dart' show AuthReducer, SharedReducer, SignUpReducer, RestoreAccessReducer;
import 'package:SmartPeopleUI/shared/middleware/api.middleware.dart';
import 'package:SmartPeopleUI/shared/middleware/print.middleware.dart';

@Injectable()
class InjectableStore extends Store {
  InjectableStore(LocalStorageService localStorage)
      : super(combineReducers([AuthReducer.reduce, SharedReducer.reduce, SignUpReducer.reduce, RestoreAccessReducer.reduce]),
            initialState: new State({}),
            middleware: applyMiddleware(
                [printMiddleware, new ApiMiddleware(localStorage).apply])){
  }
}
