library angular2.router.template.dart;

import 'router.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'src/router/directives/router_outlet.dart' show RouterOutlet;
import 'src/router/directives/router_link.dart' show RouterLink;
import 'src/router/directives/router_outlet.template.dart' as i0;
import 'src/router/directives/router_link.template.dart' as i1;
import 'src/router/router.template.dart' as i2;
import 'src/router/instruction.template.dart' as i3;
import 'src/router/location/platform_location.template.dart' as i4;
import 'src/router/route_registry.template.dart' as i5;
import 'src/router/location/location_strategy.template.dart' as i6;
import 'src/router/location/hash_location_strategy.template.dart' as i7;
import 'src/router/location/path_location_strategy.template.dart' as i8;
import 'src/router/location/location.template.dart' as i9;
import 'src/router/route_config/route_config_decorator.template.dart' as i10;
import 'src/router/route_definition.template.dart' as i11;
import 'src/router/interfaces.template.dart' as i12;
import 'src/router/lifecycle/lifecycle_annotations.template.dart' as i13;
import 'package:angular2/core.template.dart' as i14;
import 'package:angular2/src/router/router_providers_common.template.dart' as i15;
import 'package:angular2/src/router/router_providers.template.dart' as i16;
export 'router.dart';
export 'src/router/router.dart' show Router;
export 'src/router/directives/router_outlet.dart' show RouterOutlet;
export 'src/router/directives/router_link.dart' show RouterLink;
export 'src/router/instruction.dart' show RouteParams, RouteData;
export 'src/router/location/platform_location.dart' show PlatformLocation;
export 'src/router/route_registry.dart' show RouteRegistry, ROUTER_PRIMARY_COMPONENT;
export 'src/router/location/location_strategy.dart' show LocationStrategy, APP_BASE_HREF;
export 'src/router/location/hash_location_strategy.dart' show HashLocationStrategy;
export 'src/router/location/path_location_strategy.dart' show PathLocationStrategy;
export 'src/router/location/location.dart' show Location;
export 'src/router/route_config/route_config_decorator.dart';
export 'src/router/route_definition.dart';
export 'src/router/interfaces.dart' show OnActivate, OnDeactivate, OnReuse, CanDeactivate, CanReuse;
export 'src/router/lifecycle/lifecycle_annotations.dart' show CanActivate;
export 'src/router/instruction.dart' show Instruction, ComponentInstruction;
export 'package:angular2/core.dart' show OpaqueToken;
export 'package:angular2/src/router/router_providers_common.dart' show ROUTER_PROVIDERS_COMMON;
export 'package:angular2/src/router/router_providers.dart' show ROUTER_PROVIDERS, ROUTER_BINDINGS;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerSetters({'routeParams': (o, v) => o.routeParams = v, 'target': (o, v) => o.target = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
i9.initReflector();
i10.initReflector();
i11.initReflector();
i12.initReflector();
i13.initReflector();
i14.initReflector();
i15.initReflector();
i16.initReflector();
}


