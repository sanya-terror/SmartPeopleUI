library angular2.src.common.pipes.i18n_plural_pipe.template.dart;

import 'i18n_plural_pipe.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isStringMap, StringWrapper, isPresent, RegExpWrapper;
import 'package:angular2/core.dart' show Injectable, PipeTransform, Pipe;
import 'invalid_pipe_argument_exception.dart' show InvalidPipeArgumentException;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/core.template.dart' as i1;
import 'invalid_pipe_argument_exception.template.dart' as i2;
export 'i18n_plural_pipe.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(I18nPluralPipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "i18nPlural", pure: true), const Injectable()],
const [],
() => new I18nPluralPipe(),
const [PipeTransform])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


