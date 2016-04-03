library angular2.src.common.pipes.replace_pipe.template.dart;

import 'replace_pipe.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isBlank, isString, isNumber, isFunction, RegExpWrapper, StringWrapper;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/core.dart' show Injectable, PipeTransform, Pipe;
import 'invalid_pipe_argument_exception.dart' show InvalidPipeArgumentException;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/exceptions.template.dart' as i1;
import 'package:angular2/core.template.dart' as i2;
import 'invalid_pipe_argument_exception.template.dart' as i3;
export 'replace_pipe.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(ReplacePipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "replace"), const Injectable()],
const [],
() => new ReplacePipe(),
const [PipeTransform])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


