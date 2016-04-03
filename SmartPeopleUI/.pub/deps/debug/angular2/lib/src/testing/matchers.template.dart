library testing.matchers.template.dart;

import 'matchers.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:guinness2/guinness2.dart' as gns;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/facade/lang.dart' show isString;
import 'package:angular2/src/platform/dom/dom_adapter.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
export 'matchers.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


