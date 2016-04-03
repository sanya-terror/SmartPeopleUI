library angular.core.facade.dom.template.dart;

import 'browser_adapter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:html';
import 'package:angular2/platform/common_dom.dart' show setRootDomAdapter;
import 'generic_browser_adapter.dart' show GenericBrowserDomAdapter;
import 'package:angular2/src/facade/browser.dart';
import 'package:angular2/src/facade/lang.dart' show isBlank, isPresent;
import 'dart:js' as js;
import 'package:angular2/platform/common_dom.template.dart' as i0;
import 'generic_browser_adapter.template.dart' as i1;
import 'package:angular2/src/facade/lang.template.dart' as i2;
export 'browser_adapter.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


