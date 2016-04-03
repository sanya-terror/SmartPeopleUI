library angular2.transform.stylesheet_compiler.processor.template.dart;

import 'processor.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/src/compiler/source_module.dart';
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/code/source_module.dart';
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/names.dart';
import 'package:angular2/src/transform/common/ng_compiler.dart';
import 'package:angular2/src/transform/common/zone.dart' as zone;
import 'package:barback/barback.dart';
import 'package:angular2/src/compiler/source_module.template.dart' as i0;
import 'package:angular2/src/transform/common/asset_reader.template.dart' as i1;
import 'package:angular2/src/transform/common/code/source_module.template.dart' as i2;
import 'package:angular2/src/transform/common/logging.template.dart' as i3;
import 'package:angular2/src/transform/common/names.template.dart' as i4;
import 'package:angular2/src/transform/common/ng_compiler.template.dart' as i5;
import 'package:angular2/src/transform/common/zone.template.dart' as i6;
export 'processor.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}


