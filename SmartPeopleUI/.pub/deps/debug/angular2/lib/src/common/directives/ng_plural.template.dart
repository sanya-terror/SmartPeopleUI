library angular2.src.common.directives.ng_plural.template.dart;

import 'ng_plural.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show Directive, ViewContainerRef, TemplateRef, ContentChildren, QueryList, Attribute, AfterContentInit, Input;
import 'package:angular2/src/facade/lang.dart' show isPresent, NumberWrapper;
import 'package:angular2/src/facade/collection.dart' show Map;
import 'ng_switch.dart' show SwitchView;
import 'package:angular2/core.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import 'package:angular2/src/facade/collection.template.dart' as i2;
import 'ng_switch.template.dart' as i3;
export 'ng_plural.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgPluralCase, new _ngRef.ReflectionInfo(
const [const Directive(selector: "[ngPluralCase]")],
const [const [String, const Attribute("ngPluralCase")], const [TemplateRef], const [ViewContainerRef]],
(String value, TemplateRef template, ViewContainerRef viewContainer) => new NgPluralCase(value, template, viewContainer))
)
..registerType(NgPlural, new _ngRef.ReflectionInfo(
const [const Directive(selector: "[ngPlural]")],
const [const [NgLocalization]],
(NgLocalization _localization) => new NgPlural(_localization),
const [AfterContentInit],
const {
'cases': const [const ContentChildren(NgPluralCase)], 
'ngPlural': const [const Input()]})
)
..registerSetters({'cases': (o, v) => o.cases = v, 'ngPlural': (o, v) => o.ngPlural = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


