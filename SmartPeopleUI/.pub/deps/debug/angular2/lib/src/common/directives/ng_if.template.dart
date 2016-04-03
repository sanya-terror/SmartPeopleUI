library angular2.src.common.directives.ng_if.template.dart;

import 'ng_if.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show Directive, ViewContainerRef, TemplateRef;
import 'package:angular2/src/facade/lang.dart' show isBlank;
import 'package:angular2/core.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
export 'ng_if.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgIf, new _ngRef.ReflectionInfo(
const [const Directive(inputs: const ["ngIf"], selector: "[ngIf]")],
const [const [ViewContainerRef], const [TemplateRef]],
(ViewContainerRef _viewContainer, TemplateRef _templateRef) => new NgIf(_viewContainer, _templateRef))
)
..registerSetters({'ngIf': (o, v) => o.ngIf = v})
;
i0.initReflector();
i1.initReflector();
}


