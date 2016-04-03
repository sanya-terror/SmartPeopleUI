library angular2.src.core.change_detection.dynamic_change_detector.template.dart;

import 'dynamic_change_detector.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, FunctionWrapper, StringWrapper;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, MapWrapper, StringMapWrapper;
import 'abstract_change_detector.dart' show AbstractChangeDetector;
import 'event_binding.dart' show EventBinding;
import 'binding_record.dart' show BindingRecord, BindingTarget;
import 'directive_record.dart' show DirectiveRecord, DirectiveIndex;
import 'parser/locals.dart' show Locals;
import 'interfaces.dart' show ChangeDispatcher, ChangeDetectorGenConfig;
import 'change_detection_util.dart' show ChangeDetectionUtil, SimpleChange;
import 'constants.dart' show ChangeDetectionStrategy, ChangeDetectorState;
import 'proto_record.dart' show ProtoRecord, RecordType;
import 'package:angular2/src/core/reflection/reflection.dart' show reflector;
import 'package:angular2/src/facade/async.dart' show ObservableWrapper;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/exceptions.template.dart' as i1;
import 'package:angular2/src/facade/collection.template.dart' as i2;
import 'abstract_change_detector.template.dart' as i3;
import 'event_binding.template.dart' as i4;
import 'binding_record.template.dart' as i5;
import 'directive_record.template.dart' as i6;
import 'parser/locals.template.dart' as i7;
import 'interfaces.template.dart' as i8;
import 'change_detection_util.template.dart' as i9;
import 'constants.template.dart' as i10;
import 'proto_record.template.dart' as i11;
import 'package:angular2/src/core/reflection/reflection.template.dart' as i12;
import 'package:angular2/src/facade/async.template.dart' as i13;
export 'dynamic_change_detector.dart';
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
}


