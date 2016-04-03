library angular2.src.testing.benchmark_util.template.dart;

import 'benchmark_util.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/platform/browser/browser_adapter.dart' show BrowserDomAdapter;
import 'package:angular2/src/facade/browser.dart' show document, window;
import 'package:angular2/src/facade/lang.dart' show NumberWrapper, isBlank;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/platform/browser/browser_adapter.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import 'package:angular2/src/facade/exceptions.template.dart' as i2;
export 'benchmark_util.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


