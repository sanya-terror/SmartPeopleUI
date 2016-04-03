library angular2.src.web_workers.worker.router_providers.template.dart;

import 'router_providers.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/core.dart' show ApplicationRef, Provider, NgZone, APP_INITIALIZER;
import 'package:angular2/src/router/location/platform_location.dart' show PlatformLocation;
import 'platform_location.dart' show WebWorkerPlatformLocation;
import 'package:angular2/src/router/router_providers_common.dart' show ROUTER_PROVIDERS_COMMON;
import 'package:angular2/core.template.dart' as i0;
import 'package:angular2/src/router/location/platform_location.template.dart' as i1;
import 'platform_location.template.dart' as i2;
import 'package:angular2/src/router/router_providers_common.template.dart' as i3;
export 'router_providers.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


