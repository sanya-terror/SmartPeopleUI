library angular2.src.web_workers.ui.router_providers.template.dart;

import 'router_providers.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'platform_location.dart' show MessageBasedPlatformLocation;
import 'package:angular2/src/router/location/browser_platform_location.dart' show BrowserPlatformLocation;
import 'package:angular2/core.dart' show APP_INITIALIZER, Provider, Injector, NgZone;
import 'platform_location.template.dart' as i0;
import 'package:angular2/src/router/location/browser_platform_location.template.dart' as i1;
import 'package:angular2/core.template.dart' as i2;
export 'router_providers.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


