library angular2.src.core.platform_common_providers.template.dart;

import 'platform_common_providers.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type, isBlank, isPresent, assertionsEnabled;
import 'package:angular2/src/core/di.dart' show provide, Provider, Injector, OpaqueToken;
import 'package:angular2/src/core/console.dart' show Console;
import 'reflection/reflection.dart' show Reflector, reflector;
import 'reflection/reflector_reader.dart' show ReflectorReader;
import 'package:angular2/src/core/testability/testability.dart' show TestabilityRegistry;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/core/di.template.dart' as i1;
import 'package:angular2/src/core/console.template.dart' as i2;
import 'reflection/reflection.template.dart' as i3;
import 'reflection/reflector_reader.template.dart' as i4;
import 'package:angular2/src/core/testability/testability.template.dart' as i5;
export 'platform_common_providers.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}


