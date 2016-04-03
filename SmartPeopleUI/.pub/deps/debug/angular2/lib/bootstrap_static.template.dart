library angular2.bootstrap_static.template.dart;

import 'bootstrap_static.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/platform/browser_static.template.dart' as i0;
import 'package:angular2/src/core/angular_entrypoint.template.dart' as i1;
export 'bootstrap_static.dart';
export 'package:angular2/platform/browser_static.dart' show bootstrapStatic;
export 'package:angular2/src/core/angular_entrypoint.dart' show AngularEntrypoint;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


