library angular2.src.compiler.template_ast.template.dart;

import 'template_ast.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/change_detection/change_detection.dart' show AST;
import 'package:angular2/src/facade/lang.dart' show isPresent;
import 'directive_metadata.dart' show CompileDirectiveMetadata;
import 'parse_util.dart' show ParseSourceSpan;
import 'package:angular2/src/core/change_detection/change_detection.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import 'directive_metadata.template.dart' as i2;
import 'parse_util.template.dart' as i3;
export 'template_ast.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


