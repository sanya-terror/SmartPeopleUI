library angular2.browser_adapter_reexport.template.dart;

import 'browser_adapter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/platform/browser/browser_adapter.template.dart' as i0;
export 'browser_adapter.dart';
export 'package:angular2/src/platform/browser/browser_adapter.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}


