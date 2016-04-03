library angular2.router.router_link_dsl.template.dart;

import 'router_link_dsl.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/compiler.dart' show TEMPLATE_TRANSFORMS;
import 'package:angular2/core.dart' show Provider;
import 'package:angular2/src/router/directives/router_link_transform.dart' show RouterLinkTransform;
import 'package:angular2/compiler.template.dart' as i0;
import 'package:angular2/core.template.dart' as i1;
import 'package:angular2/src/router/directives/router_link_transform.template.dart' as i2;
export 'router_link_dsl.dart';
export 'package:angular2/src/router/directives/router_link_transform.dart' show RouterLinkTransform;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


