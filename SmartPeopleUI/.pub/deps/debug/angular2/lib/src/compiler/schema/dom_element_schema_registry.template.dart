library angular2.src.compiler.schema.dom_element_schema_registry.template.dart;

import 'dom_element_schema_registry.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/compiler/html_tags.dart' show splitNsName;
import 'element_schema_registry.dart' show ElementSchemaRegistry;
import 'package:angular2/src/core/di.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import 'package:angular2/src/facade/collection.template.dart' as i2;
import 'package:angular2/src/platform/dom/dom_adapter.template.dart' as i3;
import 'package:angular2/src/compiler/html_tags.template.dart' as i4;
import 'element_schema_registry.template.dart' as i5;
export 'dom_element_schema_registry.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(DomElementSchemaRegistry, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new DomElementSchemaRegistry())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}


