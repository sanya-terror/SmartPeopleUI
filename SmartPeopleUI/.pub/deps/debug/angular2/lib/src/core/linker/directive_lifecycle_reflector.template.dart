library angular2.src.core.compiler.directive_lifecycle_reflector.template.dart;

import 'directive_lifecycle_reflector.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/reflection/reflection.dart';
import 'package:angular2/src/core/linker/interfaces.dart';
import 'package:angular2/src/core/reflection/reflection.template.dart' as i0;
import 'package:angular2/src/core/linker/interfaces.template.dart' as i1;
export 'directive_lifecycle_reflector.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


