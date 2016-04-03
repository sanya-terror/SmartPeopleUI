library angular2.transform.template_compiler.generator.template.dart;

import 'generator.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:barback/barback.dart';
import 'package:angular2/src/compiler/source_module.dart';
import 'package:angular2/src/core/change_detection/interfaces.dart';
import 'package:angular2/src/facade/lang.dart';
import 'package:angular2/src/core/reflection/reflection.dart';
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/model/annotation_model.pb.dart';
import 'package:angular2/src/transform/common/model/ng_deps_model.pb.dart';
import 'package:angular2/src/transform/common/names.dart';
import 'package:angular2/src/transform/common/ng_compiler.dart';
import 'package:angular2/src/transform/common/zone.dart' as zone;
import 'package:angular2/i18n.dart';
import 'reflection/processor.dart' as reg;
import 'reflection/reflection_capabilities.dart';
import 'compile_data_creator.dart';
import 'package:angular2/src/compiler/source_module.template.dart' as i0;
import 'package:angular2/src/core/change_detection/interfaces.template.dart' as i1;
import 'package:angular2/src/facade/lang.template.dart' as i2;
import 'package:angular2/src/core/reflection/reflection.template.dart' as i3;
import 'package:angular2/src/transform/common/asset_reader.template.dart' as i4;
import 'package:angular2/src/transform/common/logging.template.dart' as i5;
import 'package:angular2/src/transform/common/model/annotation_model.pb.template.dart' as i6;
import 'package:angular2/src/transform/common/model/ng_deps_model.pb.template.dart' as i7;
import 'package:angular2/src/transform/common/names.template.dart' as i8;
import 'package:angular2/src/transform/common/ng_compiler.template.dart' as i9;
import 'package:angular2/src/transform/common/zone.template.dart' as i10;
import 'package:angular2/i18n.template.dart' as i11;
import 'reflection/processor.template.dart' as i12;
import 'reflection/reflection_capabilities.template.dart' as i13;
import 'compile_data_creator.template.dart' as i14;
export 'generator.dart';
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
i7.initReflector();
i8.initReflector();
i9.initReflector();
i10.initReflector();
i11.initReflector();
i12.initReflector();
i13.initReflector();
i14.initReflector();
}


