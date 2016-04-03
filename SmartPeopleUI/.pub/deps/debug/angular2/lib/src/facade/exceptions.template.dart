library angular.core.facade.exceptions.template.dart;

import 'exceptions.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'base_wrapped_exception.dart';
import 'exception_handler.dart';
import 'base_wrapped_exception.template.dart' as i0;
import 'exception_handler.template.dart' as i1;
export 'exceptions.dart';
export 'exception_handler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


