library angular2.src.common.pipes.json_pipe.template.dart;

import 'json_pipe.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isBlank, isPresent, Json;
import 'package:angular2/core.dart' show Injectable, PipeTransform, WrappedValue, Pipe;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/core.template.dart' as i1;
export 'json_pipe.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(JsonPipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "json", pure: false), const Injectable()],
const [],
() => new JsonPipe(),
const [PipeTransform])
)
;
i0.initReflector();
i1.initReflector();
}


