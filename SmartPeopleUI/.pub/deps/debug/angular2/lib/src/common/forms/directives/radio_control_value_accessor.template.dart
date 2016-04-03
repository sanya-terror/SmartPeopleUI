library angular2.src.common.forms.directives.radio_control_value_accessor.template.dart;

import 'radio_control_value_accessor.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show Directive, ElementRef, Renderer, Self, Provider, Attribute, Input, OnInit, OnDestroy, Injector, Injectable;
import 'package:angular2/src/common/forms/directives/control_value_accessor.dart' show NG_VALUE_ACCESSOR, ControlValueAccessor;
import 'package:angular2/src/common/forms/directives/ng_control.dart' show NgControl;
import 'package:angular2/src/facade/lang.dart' show looseIdentical, isPresent;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import 'package:angular2/core.template.dart' as i0;
import 'package:angular2/src/common/forms/directives/control_value_accessor.template.dart' as i1;
import 'package:angular2/src/common/forms/directives/ng_control.template.dart' as i2;
import 'package:angular2/src/facade/lang.template.dart' as i3;
import 'package:angular2/src/facade/collection.template.dart' as i4;
export 'radio_control_value_accessor.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(RadioControlRegistry, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new RadioControlRegistry())
)
..registerType(RadioControlValueAccessor, new _ngRef.ReflectionInfo(
const [const Directive(host: const {"(change)" : "onChange()", "(blur)" : "onTouched()"}, providers: const [RADIO_VALUE_ACCESSOR], selector: "input[type=radio][ngControl],input[type=radio][ngFormControl],input[type=radio][ngModel]")],
const [const [Renderer], const [ElementRef], const [RadioControlRegistry], const [Injector]],
(Renderer _renderer, ElementRef _elementRef, RadioControlRegistry _registry, Injector _injector) => new RadioControlValueAccessor(_renderer, _elementRef, _registry, _injector),
const [ControlValueAccessor, OnDestroy, OnInit],
const {
'name': const [const Input()]})
)
..registerSetters({'name': (o, v) => o.name = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


