library angular.events.template.dart;

import 'hammer_gestures.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:html';
import './hammer_common.dart';
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'dart:js' as js;
import './hammer_common.template.dart' as i0;
import 'package:angular2/src/facade/exceptions.template.dart' as i1;
import 'package:angular2/src/core/di.template.dart' as i2;
export 'hammer_gestures.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(HammerGesturesPlugin, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new HammerGesturesPlugin())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


