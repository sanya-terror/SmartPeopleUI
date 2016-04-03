library angular2.src.core.metadata.directives.template.dart;

import 'directives.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, Type;
import 'package:angular2/src/core/di/metadata.dart' show InjectableMetadata;
import 'package:angular2/src/core/change_detection.dart' show ChangeDetectionStrategy;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/core/di/metadata.template.dart' as i1;
import 'package:angular2/src/core/change_detection.template.dart' as i2;
import 'package:angular2/src/core/metadata/view.template.dart' as i3;
export 'directives.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


