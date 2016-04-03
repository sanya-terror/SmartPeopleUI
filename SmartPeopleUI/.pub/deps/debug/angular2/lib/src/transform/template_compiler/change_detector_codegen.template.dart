library angular2.transform.template_compiler.change_detector_codegen.template.dart;

import 'change_detector_codegen.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/change_detection/change_detection.dart';
import 'package:angular2/src/core/change_detection/change_detection_util.dart';
import 'package:angular2/src/core/change_detection/codegen_facade.dart';
import 'package:angular2/src/core/change_detection/codegen_logic_util.dart';
import 'package:angular2/src/core/change_detection/codegen_name_util.dart';
import 'package:angular2/src/core/change_detection/directive_record.dart';
import 'package:angular2/src/core/change_detection/interfaces.dart';
import 'package:angular2/src/core/change_detection/proto_change_detector.dart';
import 'package:angular2/src/core/change_detection/proto_record.dart';
import 'package:angular2/src/core/change_detection/event_binding.dart';
import 'package:angular2/src/core/change_detection/binding_record.dart';
import 'package:angular2/src/core/change_detection/codegen_facade.dart' show codify;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/core/change_detection/change_detection.template.dart' as i0;
import 'package:angular2/src/core/change_detection/change_detection_util.template.dart' as i1;
import 'package:angular2/src/core/change_detection/codegen_logic_util.template.dart' as i2;
import 'package:angular2/src/core/change_detection/codegen_name_util.template.dart' as i3;
import 'package:angular2/src/core/change_detection/directive_record.template.dart' as i4;
import 'package:angular2/src/core/change_detection/interfaces.template.dart' as i5;
import 'package:angular2/src/core/change_detection/proto_change_detector.template.dart' as i6;
import 'package:angular2/src/core/change_detection/proto_record.template.dart' as i7;
import 'package:angular2/src/core/change_detection/event_binding.template.dart' as i8;
import 'package:angular2/src/core/change_detection/binding_record.template.dart' as i9;
import 'package:angular2/src/facade/exceptions.template.dart' as i10;
import 'package:angular2/src/facade/collection.template.dart' as i11;
export 'change_detector_codegen.dart';
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
}


