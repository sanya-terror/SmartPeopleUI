library angular2.src.core.linker.compiler.template.dart;

import 'compiler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/src/core/linker/view_ref.dart' show HostViewFactoryRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/facade/lang.dart' show Type, isBlank, stringify;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/async.dart' show PromiseWrapper;
import 'package:angular2/src/core/reflection/reflection.dart' show reflector;
import 'package:angular2/src/core/linker/view.dart' show HostViewFactory;
import 'package:angular2/src/core/linker/view_ref.dart' show HostViewFactoryRef_;
import 'package:angular2/src/core/linker/view_ref.template.dart' as i0;
import 'package:angular2/src/core/di.template.dart' as i1;
import 'package:angular2/src/facade/lang.template.dart' as i2;
import 'package:angular2/src/facade/exceptions.template.dart' as i3;
import 'package:angular2/src/facade/async.template.dart' as i4;
import 'package:angular2/src/core/reflection/reflection.template.dart' as i5;
import 'package:angular2/src/core/linker/view.template.dart' as i6;
export 'compiler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Compiler_, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new Compiler_())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}


