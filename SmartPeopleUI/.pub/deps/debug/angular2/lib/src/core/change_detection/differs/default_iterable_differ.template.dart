library angular2.src.core.change_detection.differs.default_iterable_differ.template.dart;

import 'default_iterable_differ.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/collection.dart' show isListLikeIterable, iterateListLike, ListWrapper;
import 'package:angular2/src/facade/lang.dart' show isBlank, isPresent, stringify, getMapKey, looseIdentical, isArray;
import '../change_detector_ref.dart' show ChangeDetectorRef;
import '../differs/iterable_differs.dart' show IterableDiffer, IterableDifferFactory, TrackByFn;
import 'package:angular2/src/facade/exceptions.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'package:angular2/src/facade/lang.template.dart' as i2;
import '../change_detector_ref.template.dart' as i3;
import '../differs/iterable_differs.template.dart' as i4;
export 'default_iterable_differ.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


