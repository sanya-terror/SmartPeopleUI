library angular2.src.web_workers.shared.render_store.template.dart;

import 'render_store.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/di.template.dart' as i0;
export 'render_store.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(RenderStore, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new RenderStore())
)
;
i0.initReflector();
}


