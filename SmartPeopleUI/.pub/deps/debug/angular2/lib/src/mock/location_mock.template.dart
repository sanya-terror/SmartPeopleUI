library angular2.src.mock.location_mock.template.dart;

import 'location_mock.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/facade/async.dart' show EventEmitter, ObservableWrapper;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/router/location/location.dart' show Location;
import 'package:angular2/src/core/di.template.dart' as i0;
import 'package:angular2/src/facade/async.template.dart' as i1;
import 'package:angular2/src/facade/collection.template.dart' as i2;
import 'package:angular2/src/router/location/location.template.dart' as i3;
export 'location_mock.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(SpyLocation, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new SpyLocation(),
const [Location])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


