library angular2.src.router.router.template.dart;

import 'router.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/src/facade/async.dart' show PromiseWrapper, EventEmitter, ObservableWrapper;
import 'package:angular2/src/facade/collection.dart' show Map, StringMapWrapper, MapWrapper, ListWrapper;
import 'package:angular2/src/facade/lang.dart' show isBlank, isString, isPresent, Type, isArray;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/core.dart' show Inject, Injectable;
import 'route_registry.dart' show RouteRegistry, ROUTER_PRIMARY_COMPONENT;
import 'instruction.dart' show ComponentInstruction, Instruction;
import 'directives/router_outlet.dart' show RouterOutlet;
import 'location/location.dart' show Location;
import 'lifecycle/route_lifecycle_reflector.dart' show getCanActivateHook;
import 'route_config/route_config_impl.dart' show RouteDefinition;
import 'package:angular2/src/facade/async.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'package:angular2/src/facade/lang.template.dart' as i2;
import 'package:angular2/src/facade/exceptions.template.dart' as i3;
import 'package:angular2/core.template.dart' as i4;
import 'route_registry.template.dart' as i5;
import 'instruction.template.dart' as i6;
import 'directives/router_outlet.template.dart' as i7;
import 'location/location.template.dart' as i8;
import 'lifecycle/route_lifecycle_reflector.template.dart' as i9;
import 'route_config/route_config_impl.template.dart' as i10;
export 'router.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Router, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [RouteRegistry], const [Router], const [dynamic], const [Router]],
(RouteRegistry registry, Router parent, dynamic hostComponent, Router root) => new Router(registry, parent, hostComponent, root))
)
..registerType(RootRouter, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [RouteRegistry], const [Location], const [Type, const Inject(ROUTER_PRIMARY_COMPONENT)]],
(RouteRegistry registry, Location location, Type primaryComponent) => new RootRouter(registry, location, primaryComponent))
)
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
}


