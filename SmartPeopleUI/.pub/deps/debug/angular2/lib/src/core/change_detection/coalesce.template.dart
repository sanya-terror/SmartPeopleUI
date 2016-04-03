library angular2.src.core.change_detection.coalesce.template.dart;

import 'coalesce.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, looseIdentical;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, Map;
import 'proto_record.dart' show RecordType, ProtoRecord;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'proto_record.template.dart' as i2;
export 'coalesce.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


