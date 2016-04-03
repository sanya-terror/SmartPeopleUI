library angular2.di.decorators.template.dart;

import 'decorators.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'metadata.dart';
import 'metadata.template.dart' as i0;
export 'decorators.dart';
export 'metadata.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}


