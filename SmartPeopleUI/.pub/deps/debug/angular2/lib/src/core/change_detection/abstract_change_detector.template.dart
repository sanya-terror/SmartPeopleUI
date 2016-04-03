library angular2.src.core.change_detection.abstract_change_detector.template.dart;

import 'abstract_change_detector.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show assertionsEnabled, isPresent, isBlank, StringWrapper;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import 'change_detection_util.dart' show ChangeDetectionUtil;
import 'change_detector_ref.dart' show ChangeDetectorRef, ChangeDetectorRef_;
import 'directive_record.dart' show DirectiveIndex;
import 'interfaces.dart' show ChangeDetector, ChangeDispatcher;
import 'pipes.dart' show Pipes;
import 'exceptions.dart' show ChangeDetectionError, ExpressionChangedAfterItHasBeenCheckedException, DehydratedException, EventEvaluationErrorContext, EventEvaluationError;
import 'binding_record.dart' show BindingTarget;
import 'parser/locals.dart' show Locals;
import 'constants.dart' show ChangeDetectionStrategy, ChangeDetectorState;
import '../profile/profile.dart' show wtfCreateScope, wtfLeave, WtfScopeFn;
import 'package:angular2/src/facade/async.dart' show ObservableWrapper;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'change_detection_util.template.dart' as i2;
import 'change_detector_ref.template.dart' as i3;
import 'directive_record.template.dart' as i4;
import 'interfaces.template.dart' as i5;
import 'pipes.template.dart' as i6;
import 'exceptions.template.dart' as i7;
import 'binding_record.template.dart' as i8;
import 'parser/locals.template.dart' as i9;
import 'constants.template.dart' as i10;
import '../profile/profile.template.dart' as i11;
import 'package:angular2/src/facade/async.template.dart' as i12;
export 'abstract_change_detector.dart';
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
}


