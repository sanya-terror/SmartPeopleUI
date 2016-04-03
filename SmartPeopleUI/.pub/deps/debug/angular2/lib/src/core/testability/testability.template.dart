library angular2.src.core.testability.testability.template.dart;

import 'testability.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/facade/collection.dart' show Map, MapWrapper, ListWrapper;
import 'package:angular2/src/facade/lang.dart' show scheduleMicroTask;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import '../zone/ng_zone.dart' show NgZone;
import 'package:angular2/src/facade/async.dart' show ObservableWrapper;
import 'package:angular2/src/core/di.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'package:angular2/src/facade/lang.template.dart' as i2;
import 'package:angular2/src/facade/exceptions.template.dart' as i3;
import '../zone/ng_zone.template.dart' as i4;
import 'package:angular2/src/facade/async.template.dart' as i5;
export 'testability.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Testability, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [NgZone]],
(NgZone _ngZone) => new Testability(_ngZone))
)
..registerType(TestabilityRegistry, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new TestabilityRegistry())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}


