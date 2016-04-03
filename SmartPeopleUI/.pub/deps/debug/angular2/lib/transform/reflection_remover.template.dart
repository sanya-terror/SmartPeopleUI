library angular2.transform.reflection_remover.dart.template.dart;

import 'reflection_remover.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:barback/barback.dart';
import 'package:angular2/src/transform/common/options.dart';
import 'package:angular2/src/transform/common/options_reader.dart';
import 'package:angular2/src/transform/reflection_remover/transformer.dart' as base show ReflectionRemover;
import 'package:angular2/src/transform/common/options.template.dart' as i0;
import 'package:angular2/src/transform/common/options_reader.template.dart' as i1;
import 'package:angular2/src/transform/reflection_remover/transformer.template.dart' as i2;
export 'reflection_remover.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


