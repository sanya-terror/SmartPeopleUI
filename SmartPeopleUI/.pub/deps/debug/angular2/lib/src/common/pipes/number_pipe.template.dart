library angular2.src.common.pipes.number_pipe.template.dart;

import 'number_pipe.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isNumber, isPresent, isBlank, StringWrapper, NumberWrapper, RegExpWrapper, FunctionWrapper;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/facade/intl.dart' show NumberFormatter, NumberFormatStyle;
import 'package:angular2/core.dart' show Injectable, PipeTransform, WrappedValue, Pipe;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import 'invalid_pipe_argument_exception.dart' show InvalidPipeArgumentException;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/exceptions.template.dart' as i1;
import 'package:angular2/src/facade/intl.template.dart' as i2;
import 'package:angular2/core.template.dart' as i3;
import 'package:angular2/src/facade/collection.template.dart' as i4;
import 'invalid_pipe_argument_exception.template.dart' as i5;
export 'number_pipe.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NumberPipe, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new NumberPipe())
)
..registerType(DecimalPipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "number"), const Injectable()],
const [],
() => new DecimalPipe(),
const [PipeTransform])
)
..registerType(PercentPipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "percent"), const Injectable()],
const [],
() => new PercentPipe(),
const [PipeTransform])
)
..registerType(CurrencyPipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "currency"), const Injectable()],
const [],
() => new CurrencyPipe(),
const [PipeTransform])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}


