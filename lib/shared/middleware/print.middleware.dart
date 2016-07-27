import 'package:SmartPeopleUI/redux/index.dart';
import 'dart:html';

dynamic printMiddleware(Store store) => (Dispatcher next) => (Action action) async {
      window.console.debug('PRINTER: Action dispatch. Type: ${action.type}; data: ${action.data}');
      return next(action);
    };
