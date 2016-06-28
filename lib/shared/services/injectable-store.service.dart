import 'package:angular2/core.dart' show Injectable;
import 'package:SmartPeopleUI/shared/services/local-storage.service.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/account-management/auth.reducer.dart';
import 'package:SmartPeopleUI/account-management/restore-access/restore-access.reducer.dart';
import 'package:SmartPeopleUI/shared/middleware/api.middleware.dart';
import 'package:SmartPeopleUI/shared/middleware/print.middleware.dart';
import 'package:SmartPeopleUI/shared/reducers/index.dart';

@Injectable()
class InjectableStore extends Store {
  InjectableStore(LocalStorageService localStorage)
      : super(combineReducers([AuthReducer.reduce, RestoreAccessReducer.reduce, ApiErrorsReducer.reduce]),
            initialState: new State({}),
            middleware: applyMiddleware(
                [printMiddleware, new ApiMiddleware(localStorage).apply])){
  }
}
