library angular2.src.platform.dom.events.dom_events.template.dart;

import 'dom_events.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/core.dart' show Injectable;
import 'event_manager.dart' show EventManagerPlugin, EventManager;
import 'package:angular2/src/platform/dom/dom_adapter.template.dart' as i0;
import 'package:angular2/core.template.dart' as i1;
import 'event_manager.template.dart' as i2;
export 'dom_events.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(DomEventsPlugin, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new DomEventsPlugin())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


