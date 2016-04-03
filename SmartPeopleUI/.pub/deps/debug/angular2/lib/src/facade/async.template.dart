library angular2.core.facade.async.template.dart;

import 'async.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'promise.template.dart' as i0;
export 'async.dart';
export 'dart:async' show Stream, StreamController, StreamSubscription;
export 'promise.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}


