library angular2.src.testing.test_injector.template.dart;

import 'test_injector.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show Injector, Provider, PLATFORM_INITIALIZER;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, ExceptionHandler;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/facade/lang.dart' show FunctionWrapper, isPresent, Type;
import 'package:angular2/core.template.dart' as i0;
import 'package:angular2/src/facade/exceptions.template.dart' as i1;
import 'package:angular2/src/facade/collection.template.dart' as i2;
import 'package:angular2/src/facade/lang.template.dart' as i3;
export 'test_injector.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


