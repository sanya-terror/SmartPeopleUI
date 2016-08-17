import 'package:smartpeople_client/redux/index.dart';
import 'dart:html';

Pipe printMiddleware(Store store) => (Dispatcher next) => (Action action) async {
      window.console.debug('PRINTER: Action dispatch. Type: ${action.type}; data: ${action.data}');
      return next(action);
    };
