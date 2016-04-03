library angular2.src.tools.tools.template.dart;

import 'tools.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:js';
import 'package:angular2/src/core/linker/dynamic_component_loader.dart' show ComponentRef;
import 'common_tools.dart' show AngularTools;
import 'package:angular2/src/core/linker/dynamic_component_loader.template.dart' as i0;
import 'common_tools.template.dart' as i1;
export 'tools.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


