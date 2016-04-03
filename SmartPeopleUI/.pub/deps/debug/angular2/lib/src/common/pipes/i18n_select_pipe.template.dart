library angular2.src.common.pipes.i18n_select_pipe.template.dart;

import 'i18n_select_pipe.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isStringMap;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper;
import 'package:angular2/core.dart' show Injectable, PipeTransform, Pipe;
import 'invalid_pipe_argument_exception.dart' show InvalidPipeArgumentException;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'package:angular2/core.template.dart' as i2;
import 'invalid_pipe_argument_exception.template.dart' as i3;
export 'i18n_select_pipe.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(I18nSelectPipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "i18nSelect", pure: true), const Injectable()],
const [],
() => new I18nSelectPipe(),
const [PipeTransform])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


