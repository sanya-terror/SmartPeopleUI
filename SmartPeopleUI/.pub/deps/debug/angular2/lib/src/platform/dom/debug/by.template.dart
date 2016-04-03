library angular2.src.platform.dom.debug.by.template.dart;

import 'by.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type, isPresent, isBlank;
import 'package:angular2/src/facade/collection.dart' show Predicate;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/core.dart' show DebugElement;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'package:angular2/src/platform/dom/dom_adapter.template.dart' as i2;
import 'package:angular2/core.template.dart' as i3;
export 'by.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


