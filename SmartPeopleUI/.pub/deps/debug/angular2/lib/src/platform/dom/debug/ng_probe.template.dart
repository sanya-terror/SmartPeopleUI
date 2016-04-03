library angular2.src.platform.dom.debug.ng_probe.template.dart;

import 'ng_probe.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show assertionsEnabled, isPresent;
import 'package:angular2/src/core/di.dart' show Injectable, provide, Provider;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/core/debug/debug_node.dart' show DebugNode, getDebugNode;
import 'package:angular2/src/platform/dom/dom_renderer.dart' show DomRootRenderer;
import 'package:angular2/core.dart' show RootRenderer, NgZone, ApplicationRef;
import 'package:angular2/src/core/debug/debug_renderer.dart' show DebugDomRootRenderer;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/core/di.template.dart' as i1;
import 'package:angular2/src/platform/dom/dom_adapter.template.dart' as i2;
import 'package:angular2/src/core/debug/debug_node.template.dart' as i3;
import 'package:angular2/src/platform/dom/dom_renderer.template.dart' as i4;
import 'package:angular2/core.template.dart' as i5;
import 'package:angular2/src/core/debug/debug_renderer.template.dart' as i6;
export 'ng_probe.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}


