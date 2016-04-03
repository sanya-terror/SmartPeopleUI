library angular2.src.core.render.api.template.dart;

import 'api.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation;
import 'package:angular2/src/core/di.dart' show Injector, Injectable;
import 'package:angular2/src/core/metadata/view.template.dart' as i0;
import 'package:angular2/src/core/di.template.dart' as i1;
export 'api.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


