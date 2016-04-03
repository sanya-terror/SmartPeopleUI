library angular2.src.mock.view_resolver_mock.template.dart;

import 'view_resolver_mock.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/facade/collection.dart' show Map, MapWrapper, ListWrapper;
import 'package:angular2/src/facade/lang.dart' show Type, isPresent, stringify, isBlank;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import '../core/metadata.dart' show ViewMetadata;
import 'package:angular2/src/core/linker/view_resolver.dart' show ViewResolver;
import 'package:angular2/src/core/di.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'package:angular2/src/facade/lang.template.dart' as i2;
import 'package:angular2/src/facade/exceptions.template.dart' as i3;
import '../core/metadata.template.dart' as i4;
import 'package:angular2/src/core/linker/view_resolver.template.dart' as i5;
export 'view_resolver_mock.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(MockViewResolver, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new MockViewResolver())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}


