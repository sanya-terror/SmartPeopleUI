library angular2.src.core.change_detection.differs.keyvalue_differs.template.dart;

import 'keyvalue_differs.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isBlank, isPresent;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import '../change_detector_ref.dart' show ChangeDetectorRef;
import 'package:angular2/src/core/di.dart' show Provider, SkipSelfMetadata, OptionalMetadata, Injectable;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/exceptions.template.dart' as i1;
import 'package:angular2/src/facade/collection.template.dart' as i2;
import '../change_detector_ref.template.dart' as i3;
import 'package:angular2/src/core/di.template.dart' as i4;
export 'keyvalue_differs.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(KeyValueDiffers, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [List]],
(List<KeyValueDifferFactory> factories) => new KeyValueDiffers(factories))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


