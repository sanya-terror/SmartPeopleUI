library angular2.src.core.debug.debug_renderer.template.dart;

import 'debug_renderer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent;
import 'package:angular2/src/core/render/api.dart' show Renderer, RootRenderer, RenderComponentType, RenderDebugInfo;
import 'package:angular2/src/core/debug/debug_node.dart' show DebugNode, DebugElement, EventListener, getDebugNode, indexDebugNode, removeDebugNodeFromIndex;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/core/render/api.template.dart' as i1;
import 'package:angular2/src/core/debug/debug_node.template.dart' as i2;
export 'debug_renderer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


