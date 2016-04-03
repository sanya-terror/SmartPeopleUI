library angular2.src.core.pipes.pipe_provider.template.dart;

import 'pipe_provider.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type;
import 'package:angular2/src/core/di/provider.dart' show ResolvedFactory, resolveProvider, ResolvedProvider_;
import 'package:angular2/src/core/di.dart' show Key, ResolvedProvider, Provider;
import '../metadata/directives.dart' show PipeMetadata;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/core/di/provider.template.dart' as i1;
import 'package:angular2/src/core/di.template.dart' as i2;
import '../metadata/directives.template.dart' as i3;
export 'pipe_provider.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


