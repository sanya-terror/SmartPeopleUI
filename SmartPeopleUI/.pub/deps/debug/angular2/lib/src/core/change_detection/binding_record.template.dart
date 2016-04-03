library angular2.src.core.change_detection.binding_record.template.dart;

import 'binding_record.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank;
import 'package:angular2/src/core/reflection/types.dart' show SetterFn;
import 'parser/ast.dart' show AST;
import 'directive_record.dart' show DirectiveIndex, DirectiveRecord;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/core/reflection/types.template.dart' as i1;
import 'parser/ast.template.dart' as i2;
import 'directive_record.template.dart' as i3;
export 'binding_record.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


