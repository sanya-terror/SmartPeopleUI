library change_detection.jit_proto_change_detector.template.dart;

import 'jit_proto_change_detector.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'interfaces.dart' show ChangeDetector, ProtoChangeDetector;
import 'interfaces.template.dart' as i0;
export 'jit_proto_change_detector.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}


