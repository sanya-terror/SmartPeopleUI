library angular2.src.common.forms.directives.ng_control_group.template.dart;

import 'ng_control_group.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show OnInit, OnDestroy, Directive, Optional, Inject, Host, SkipSelf, Provider, Self;
import 'control_container.dart' show ControlContainer;
import 'shared.dart' show controlPath, composeValidators, composeAsyncValidators;
import '../model.dart' show ControlGroup;
import 'form_interface.dart' show Form;
import '../validators.dart' show NG_VALIDATORS, NG_ASYNC_VALIDATORS;
import 'validators.dart' show AsyncValidatorFn, ValidatorFn;
import 'package:angular2/core.template.dart' as i0;
import 'control_container.template.dart' as i1;
import 'shared.template.dart' as i2;
import '../model.template.dart' as i3;
import 'form_interface.template.dart' as i4;
import '../validators.template.dart' as i5;
import 'validators.template.dart' as i6;
export 'ng_control_group.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgControlGroup, new _ngRef.ReflectionInfo(
const [const Directive(exportAs: "ngForm", inputs: const ["name: ngControlGroup"], providers: const [controlGroupProvider], selector: "[ngControlGroup]")],
const [const [ControlContainer, const Host(), const SkipSelf()], const [List, const Optional(), const Self(), const Inject(NG_VALIDATORS)], const [List, const Optional(), const Self(), const Inject(NG_ASYNC_VALIDATORS)]],
(ControlContainer parent, List<dynamic> _validators, List<dynamic> _asyncValidators) => new NgControlGroup(parent, _validators, _asyncValidators),
const [OnInit, OnDestroy])
)
..registerSetters({'name': (o, v) => o.name = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}


