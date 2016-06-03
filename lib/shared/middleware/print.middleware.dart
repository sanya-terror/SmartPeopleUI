import 'package:SmartPeopleUI/redux/index.dart';

dynamic printMiddleware(Store store) => (Dispatcher next) => (Action action) async {
   print('Action type: ${action.type}; action data: ${action.data}');
   return next(action);
};
