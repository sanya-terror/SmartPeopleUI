library angular2.platform.browser_static.template.dart;

import 'browser_static.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/src/facade/lang.dart' show Type, isPresent;
import 'package:angular2/src/platform/browser_common.dart' show BROWSER_PROVIDERS, BROWSER_APP_COMMON_PROVIDERS;
import 'package:angular2/core.dart' show ComponentRef, platform;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/platform/browser_common.template.dart' as i1;
import 'package:angular2/core.template.dart' as i2;
import 'package:angular2/src/core/angular_entrypoint.template.dart' as i3;
export 'browser_static.dart';
export 'package:angular2/src/core/angular_entrypoint.dart' show AngularEntrypoint;
export 'package:angular2/src/platform/browser_common.dart' show BROWSER_PROVIDERS, ELEMENT_PROBE_PROVIDERS, ELEMENT_PROBE_PROVIDERS_PROD_MODE, inspectNativeElement, BrowserDomAdapter, By, Title, enableDebugTools, disableDebugTools;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


