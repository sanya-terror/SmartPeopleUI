library angular2.compiler.template.dart;

import 'compiler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'src/compiler/url_resolver.template.dart' as i0;
import 'src/compiler/xhr.template.dart' as i1;
import 'src/compiler/compiler.template.dart' as i2;
export 'compiler.dart';
export 'src/compiler/url_resolver.dart';
export 'src/compiler/xhr.dart';
export 'src/compiler/compiler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


