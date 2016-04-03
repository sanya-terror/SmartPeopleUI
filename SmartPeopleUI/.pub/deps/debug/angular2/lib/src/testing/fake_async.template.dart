library testing.fake_async.template.dart;

import 'fake_async.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async' show runZoned, ZoneSpecification;
import 'package:quiver/testing/async.dart' as quiver;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/exceptions.template.dart' as i0;
export 'fake_async.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}


