library angular2.src.core.debug.debug_node.template.dart;

import 'debug_node.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent;
import 'package:angular2/src/facade/collection.dart' show Predicate;
import 'package:angular2/src/core/di.dart' show Injector;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, MapWrapper;
import 'package:angular2/src/core/render/api.dart' show RenderDebugInfo;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'package:angular2/src/core/di.template.dart' as i2;
import 'package:angular2/src/core/render/api.template.dart' as i3;
export 'debug_node.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


