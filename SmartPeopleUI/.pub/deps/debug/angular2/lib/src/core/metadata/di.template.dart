library angular2.src.core.metadata.di.template.dart;

import 'di.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type, stringify, isPresent, isString;
import 'package:angular2/src/core/di.dart' show resolveForwardRef;
import 'package:angular2/src/core/di/metadata.dart' show DependencyMetadata;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/core/di.template.dart' as i1;
import 'package:angular2/src/core/di/metadata.template.dart' as i2;
export 'di.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


