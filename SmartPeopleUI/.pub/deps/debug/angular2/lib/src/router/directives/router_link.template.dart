library angular2.src.router.directives.router_link.template.dart;

import 'router_link.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show Directive;
import 'package:angular2/src/facade/lang.dart' show isString;
import '../router.dart' show Router;
import '../location/location.dart' show Location;
import '../instruction.dart' show Instruction;
import 'package:angular2/core.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import '../router.template.dart' as i2;
import '../location/location.template.dart' as i3;
import '../instruction.template.dart' as i4;
export 'router_link.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(RouterLink, new _ngRef.ReflectionInfo(
const [const Directive(host: const {"(click)" : "onClick()", "[attr.href]" : "visibleHref", "[class.router-link-active]" : "isRouteActive"}, inputs: const ["routeParams: routerLink", "target: target"], selector: "[routerLink]")],
const [const [Router], const [Location]],
(Router _router, Location _location) => new RouterLink(_router, _location))
)
..registerSetters({'routeParams': (o, v) => o.routeParams = v, 'target': (o, v) => o.target = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


