library angular2.src.core.change_detection.interfaces.template.dart;

import 'interfaces.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'parser/locals.dart' show Locals;
import 'binding_record.dart' show BindingTarget, BindingRecord;
import 'directive_record.dart' show DirectiveRecord, DirectiveIndex;
import 'constants.dart' show ChangeDetectionStrategy;
import 'change_detector_ref.dart' show ChangeDetectorRef;
import 'parser/locals.template.dart' as i0;
import 'binding_record.template.dart' as i1;
import 'directive_record.template.dart' as i2;
import 'constants.template.dart' as i3;
import 'change_detector_ref.template.dart' as i4;
export 'interfaces.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


