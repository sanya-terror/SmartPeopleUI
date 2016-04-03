library angular.zone.template.dart;

import 'ng_zone_impl.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:stack_trace/stack_trace.dart' show Chain;
export 'ng_zone_impl.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
}


