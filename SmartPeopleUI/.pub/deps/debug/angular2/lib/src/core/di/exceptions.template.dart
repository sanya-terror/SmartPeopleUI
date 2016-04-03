library angular2.src.core.di.exceptions.template.dart;

import 'exceptions.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/facade/lang.dart' show stringify, isBlank;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException, unimplemented;
import 'key.dart' show Key;
import 'injector.dart' show Injector;
import 'package:angular2/src/facade/collection.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import 'package:angular2/src/facade/exceptions.template.dart' as i2;
import 'key.template.dart' as i3;
import 'injector.template.dart' as i4;
export 'exceptions.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


