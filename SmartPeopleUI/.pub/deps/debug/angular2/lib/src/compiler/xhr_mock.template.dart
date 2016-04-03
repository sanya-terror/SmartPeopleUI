library angular2.src.compiler.xhr_mock.template.dart;

import 'xhr_mock.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/src/compiler/xhr.dart' show XHR;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, Map, MapWrapper;
import 'package:angular2/src/facade/lang.dart' show isBlank, isPresent;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/facade/async.dart' show PromiseCompleter, PromiseWrapper;
import 'package:angular2/src/compiler/xhr.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'package:angular2/src/facade/lang.template.dart' as i2;
import 'package:angular2/src/facade/exceptions.template.dart' as i3;
import 'package:angular2/src/facade/async.template.dart' as i4;
export 'xhr_mock.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


