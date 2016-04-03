library angular2.src.core.change_detection.change_detector_ref.template.dart;

import 'change_detector_ref.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'interfaces.dart' show ChangeDetector;
import 'constants.dart' show ChangeDetectionStrategy;
import 'interfaces.template.dart' as i0;
import 'constants.template.dart' as i1;
export 'change_detector_ref.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


