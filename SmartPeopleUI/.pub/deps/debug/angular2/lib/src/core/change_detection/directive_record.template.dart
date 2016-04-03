library angular2.src.core.change_detection.directive_record.template.dart;

import 'directive_record.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show StringWrapper, normalizeBool, isBlank;
import 'constants.dart' show isDefaultChangeDetectionStrategy, ChangeDetectionStrategy;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'constants.template.dart' as i1;
export 'directive_record.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


