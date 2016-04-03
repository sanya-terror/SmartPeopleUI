library angular2.src.core.application_tokens.template.dart;

import 'application_tokens.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show OpaqueToken, Provider;
import 'package:angular2/src/facade/lang.dart' show Math, StringWrapper;
import 'package:angular2/src/core/di.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
export 'application_tokens.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


