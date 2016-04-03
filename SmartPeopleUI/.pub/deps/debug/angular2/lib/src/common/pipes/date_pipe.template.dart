library angular2.src.common.pipes.date_pipe.template.dart;

import 'date_pipe.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isDate, isNumber, isPresent, DateTime, DateWrapper, isBlank, FunctionWrapper;
import 'package:angular2/src/facade/intl.dart' show DateFormatter;
import 'package:angular2/core.dart' show PipeTransform, WrappedValue, Pipe, Injectable;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper, ListWrapper;
import 'invalid_pipe_argument_exception.dart' show InvalidPipeArgumentException;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/intl.template.dart' as i1;
import 'package:angular2/core.template.dart' as i2;
import 'package:angular2/src/facade/collection.template.dart' as i3;
import 'invalid_pipe_argument_exception.template.dart' as i4;
export 'date_pipe.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(DatePipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "date", pure: true), const Injectable()],
const [],
() => new DatePipe(),
const [PipeTransform])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


