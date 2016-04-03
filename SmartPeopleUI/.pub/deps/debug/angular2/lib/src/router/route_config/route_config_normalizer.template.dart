library angular2.src.router.route_config_normalizer.template.dart;

import 'route_config_normalizer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'route_config_decorator.dart';
import '../route_definition.dart';
import '../route_registry.dart';
import 'package:angular2/src/facade/lang.dart';
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'route_config_decorator.template.dart' as i0;
import '../route_definition.template.dart' as i1;
import '../route_registry.template.dart' as i2;
import 'package:angular2/src/facade/lang.template.dart' as i3;
import 'package:angular2/src/facade/exceptions.template.dart' as i4;
export 'route_config_normalizer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


