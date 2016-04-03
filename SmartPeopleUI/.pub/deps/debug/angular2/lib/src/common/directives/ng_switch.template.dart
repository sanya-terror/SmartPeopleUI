library angular2.src.common.directives.ng_switch.template.dart;

import 'ng_switch.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show Directive, Host, ViewContainerRef, TemplateRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, Map;
import 'package:angular2/core.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import 'package:angular2/src/facade/collection.template.dart' as i2;
export 'ng_switch.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgSwitch, new _ngRef.ReflectionInfo(
const [const Directive(inputs: const ["ngSwitch"], selector: "[ngSwitch]")],
const [],
() => new NgSwitch())
)
..registerType(NgSwitchWhen, new _ngRef.ReflectionInfo(
const [const Directive(inputs: const ["ngSwitchWhen"], selector: "[ngSwitchWhen]")],
const [const [ViewContainerRef], const [TemplateRef], const [NgSwitch, const Host()]],
(ViewContainerRef viewContainer, TemplateRef templateRef, NgSwitch ngSwitch) => new NgSwitchWhen(viewContainer, templateRef, ngSwitch))
)
..registerType(NgSwitchDefault, new _ngRef.ReflectionInfo(
const [const Directive(selector: "[ngSwitchDefault]")],
const [const [ViewContainerRef], const [TemplateRef], const [NgSwitch, const Host()]],
(ViewContainerRef viewContainer, TemplateRef templateRef, NgSwitch sswitch) => new NgSwitchDefault(viewContainer, templateRef, sswitch))
)
..registerSetters({'ngSwitch': (o, v) => o.ngSwitch = v, 'ngSwitchWhen': (o, v) => o.ngSwitchWhen = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


