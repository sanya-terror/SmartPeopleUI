library angular2.src.core.linker.view_resolver.template.dart;

import 'view_resolver.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import '../metadata/view.dart' show ViewMetadata;
import '../metadata/directives.dart' show ComponentMetadata;
import 'package:angular2/src/facade/lang.dart' show Type, stringify, isBlank, isPresent;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/collection.dart' show Map;
import 'package:angular2/src/core/reflection/reflector_reader.dart' show ReflectorReader;
import 'package:angular2/src/core/reflection/reflection.dart' show reflector;
import 'package:angular2/src/core/di.template.dart' as i0;
import '../metadata/view.template.dart' as i1;
import '../metadata/directives.template.dart' as i2;
import 'package:angular2/src/facade/lang.template.dart' as i3;
import 'package:angular2/src/facade/exceptions.template.dart' as i4;
import 'package:angular2/src/facade/collection.template.dart' as i5;
import 'package:angular2/src/core/reflection/reflector_reader.template.dart' as i6;
import 'package:angular2/src/core/reflection/reflection.template.dart' as i7;
export 'view_resolver.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(ViewResolver, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [ReflectorReader]],
(ReflectorReader _reflector) => new ViewResolver(_reflector))
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
}


