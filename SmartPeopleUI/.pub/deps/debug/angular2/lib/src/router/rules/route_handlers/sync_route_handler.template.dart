library angular2.src.router.rules.route_handlers.sync_route_handler.template.dart;

import 'sync_route_handler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/src/facade/async.dart' show PromiseWrapper;
import 'package:angular2/src/facade/lang.dart' show isPresent, Type;
import 'route_handler.dart' show RouteHandler;
import '../../instruction.dart' show RouteData, BLANK_ROUTE_DATA;
import 'package:angular2/src/facade/async.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import 'route_handler.template.dart' as i2;
import '../../instruction.template.dart' as i3;
export 'sync_route_handler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


