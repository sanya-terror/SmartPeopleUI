library angular2.src.compiler.source_module.template.dart;

import 'source_module.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show StringWrapper, isBlank;
import 'package:angular2/src/facade/lang.template.dart' as i0;
export 'source_module.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}


