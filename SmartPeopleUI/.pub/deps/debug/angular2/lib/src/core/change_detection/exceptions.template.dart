library angular2.src.core.change_detection.exceptions.template.dart;

import 'exceptions.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/facade/exceptions.template.dart' as i0;
export 'exceptions.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}


