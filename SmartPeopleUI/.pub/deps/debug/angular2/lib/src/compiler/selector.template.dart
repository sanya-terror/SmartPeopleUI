library angular2.src.compiler.selector.template.dart;

import 'selector.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/collection.dart' show Map, ListWrapper, MapWrapper;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, RegExpWrapper, RegExpMatcherWrapper, StringWrapper;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/facade/collection.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import 'package:angular2/src/facade/exceptions.template.dart' as i2;
export 'selector.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


