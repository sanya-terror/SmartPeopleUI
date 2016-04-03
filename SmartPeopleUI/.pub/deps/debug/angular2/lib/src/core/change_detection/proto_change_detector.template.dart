library angular2.src.core.change_detection.proto_change_detector.template.dart;

import 'proto_change_detector.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type, isBlank, isPresent, isString;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, MapWrapper, StringMapWrapper;
import 'parser/ast.dart' show PropertyRead, PropertyWrite, KeyedWrite, AST, ASTWithSource, AstVisitor, Binary, Chain, Conditional, BindingPipe, FunctionCall, ImplicitReceiver, Interpolation, KeyedRead, LiteralArray, LiteralMap, LiteralPrimitive, MethodCall, PrefixNot, Quote, SafePropertyRead, SafeMethodCall;
import 'interfaces.dart' show ChangeDetector, ProtoChangeDetector, ChangeDetectorDefinition;
import 'change_detection_util.dart' show ChangeDetectionUtil;
import 'dynamic_change_detector.dart' show DynamicChangeDetector;
import 'binding_record.dart' show BindingRecord, BindingTarget;
import 'directive_record.dart' show DirectiveRecord, DirectiveIndex;
import 'event_binding.dart' show EventBinding;
import 'coalesce.dart' show coalesce;
import 'proto_record.dart' show ProtoRecord, RecordType;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/exceptions.template.dart' as i1;
import 'package:angular2/src/facade/collection.template.dart' as i2;
import 'parser/ast.template.dart' as i3;
import 'interfaces.template.dart' as i4;
import 'change_detection_util.template.dart' as i5;
import 'dynamic_change_detector.template.dart' as i6;
import 'binding_record.template.dart' as i7;
import 'directive_record.template.dart' as i8;
import 'event_binding.template.dart' as i9;
import 'coalesce.template.dart' as i10;
import 'proto_record.template.dart' as i11;
export 'proto_change_detector.dart';
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


