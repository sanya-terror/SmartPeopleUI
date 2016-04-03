library angular2.src.router.rules.route_handlers.async_route_handler.template.dart;

import 'async_route_handler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/src/facade/lang.dart' show isPresent, Type;
import 'route_handler.dart' show RouteHandler;
import '../../instruction.dart' show RouteData, BLANK_ROUTE_DATA;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'route_handler.template.dart' as i1;
import '../../instruction.template.dart' as i2;
export 'async_route_handler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


