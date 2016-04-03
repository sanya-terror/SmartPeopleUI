library angular2.src.core.change_detection.differs.default_keyvalue_differ.template.dart;

import 'default_keyvalue_differ.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/collection.dart' show MapWrapper, StringMapWrapper;
import 'package:angular2/src/facade/lang.dart' show stringify, looseIdentical, isJsObject, isBlank;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import '../change_detector_ref.dart' show ChangeDetectorRef;
import '../differs/keyvalue_differs.dart' show KeyValueDiffer, KeyValueDifferFactory;
import 'package:angular2/src/facade/collection.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import 'package:angular2/src/facade/exceptions.template.dart' as i2;
import '../change_detector_ref.template.dart' as i3;
import '../differs/keyvalue_differs.template.dart' as i4;
export 'default_keyvalue_differ.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


