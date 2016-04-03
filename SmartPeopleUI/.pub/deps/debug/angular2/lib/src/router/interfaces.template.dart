library angular2.src.router.interfaces.template.dart;

import 'interfaces.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'instruction.dart' show ComponentInstruction;
import 'package:angular2/src/facade/lang.dart' show global;
import 'instruction.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
export 'interfaces.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


