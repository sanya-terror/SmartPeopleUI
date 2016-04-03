library angular2.src.compiler.html_ast.template.dart;

import 'html_ast.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent;
import 'parse_util.dart' show ParseSourceSpan;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'parse_util.template.dart' as i1;
export 'html_ast.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


