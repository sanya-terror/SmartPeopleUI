library angular2.src.core.change_detection.codegen_logic_util.template.dart;

import 'codegen_logic_util.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show IS_DART, Json, StringWrapper, isPresent, isBlank;
import 'codegen_name_util.dart' show CodegenNameUtil;
import 'codegen_facade.dart' show codify, combineGeneratedStrings, rawString;
import 'proto_record.dart' show ProtoRecord, RecordType;
import 'binding_record.dart' show BindingTarget;
import 'directive_record.dart' show DirectiveRecord;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'codegen_name_util.template.dart' as i1;
import 'proto_record.template.dart' as i2;
import 'binding_record.template.dart' as i3;
import 'directive_record.template.dart' as i4;
import 'package:angular2/src/facade/exceptions.template.dart' as i5;
export 'codegen_logic_util.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}


