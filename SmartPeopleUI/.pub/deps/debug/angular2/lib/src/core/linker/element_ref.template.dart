library angular2.src.core.linker.element_ref.template.dart;

import 'element_ref.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/exceptions.dart' show unimplemented;
import 'element.dart' show AppElement;
import 'package:angular2/src/facade/exceptions.template.dart' as i0;
import 'element.template.dart' as i1;
export 'element_ref.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


