library angular2.src.core.change_detection.change_detection_util.template.dart;

import 'change_detection_util.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, Type, StringWrapper, looseIdentical, isPrimitive;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, MapWrapper, StringMapWrapper, isListLikeIterable, areIterablesEqual;
import 'proto_record.dart' show ProtoRecord;
import 'constants.dart' show ChangeDetectionStrategy, isDefaultChangeDetectionStrategy;
import 'pipe_lifecycle_reflector.dart' show implementsOnDestroy;
import 'binding_record.dart' show BindingTarget;
import 'directive_record.dart' show DirectiveIndex;
import 'pipes.dart' show SelectedPipe;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/exceptions.template.dart' as i1;
import 'package:angular2/src/facade/collection.template.dart' as i2;
import 'proto_record.template.dart' as i3;
import 'constants.template.dart' as i4;
import 'pipe_lifecycle_reflector.template.dart' as i5;
import 'binding_record.template.dart' as i6;
import 'directive_record.template.dart' as i7;
import 'pipes.template.dart' as i8;
export 'change_detection_util.dart';
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
}


