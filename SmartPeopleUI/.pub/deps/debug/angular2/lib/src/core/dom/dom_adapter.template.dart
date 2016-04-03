library angular2.dom_adapter_reexport.template.dart;

import 'dom_adapter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/platform/dom/dom_adapter.template.dart' as i0;
export 'dom_adapter.dart';
export 'package:angular2/src/platform/dom/dom_adapter.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}


