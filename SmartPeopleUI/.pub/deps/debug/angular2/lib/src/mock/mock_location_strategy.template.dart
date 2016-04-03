library angular2.src.mock.mock_location_strategy.template.dart;

import 'mock_location_strategy.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/facade/async.dart' show EventEmitter, ObservableWrapper;
import 'package:angular2/src/router/location/location_strategy.dart' show LocationStrategy;
import 'package:angular2/src/core/di.template.dart' as i0;
import 'package:angular2/src/facade/async.template.dart' as i1;
import 'package:angular2/src/router/location/location_strategy.template.dart' as i2;
export 'mock_location_strategy.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(MockLocationStrategy, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new MockLocationStrategy())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


