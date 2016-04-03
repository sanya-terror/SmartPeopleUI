library angular.router.route_lifecycle_reflector.template.dart;

import 'route_lifecycle_reflector.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/router/lifecycle/lifecycle_annotations_impl.dart';
import 'package:angular2/src/router/interfaces.dart';
import 'package:angular2/src/core/reflection/reflection.dart';
import 'package:angular2/src/router/lifecycle/lifecycle_annotations_impl.template.dart' as i0;
import 'package:angular2/src/router/interfaces.template.dart' as i1;
import 'package:angular2/src/core/reflection/reflection.template.dart' as i2;
export 'route_lifecycle_reflector.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


