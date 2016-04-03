library angular2.transform.deferred_rewriter.dart.template.dart;

import 'deferred_rewriter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:barback/barback.dart';
import 'package:angular2/src/transform/deferred_rewriter/transformer.dart' as base show DeferredRewriter;
import 'package:angular2/src/transform/deferred_rewriter/transformer.template.dart' as i0;
export 'deferred_rewriter.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}


