library angular2.src.core.change_detection.codegen_name_util.template.dart;

import 'codegen_name_util.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show RegExpWrapper, StringWrapper;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, MapWrapper, Map;
import 'directive_record.dart' show DirectiveIndex;
import 'proto_record.dart' show ProtoRecord;
import 'event_binding.dart' show EventBinding;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'directive_record.template.dart' as i2;
import 'proto_record.template.dart' as i3;
import 'event_binding.template.dart' as i4;
export 'codegen_name_util.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


