library angular2.src.common.forms.directives.ng_model.template.dart;

import 'ng_model.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/async.dart' show EventEmitter, ObservableWrapper;
import 'package:angular2/core.dart' show OnChanges, SimpleChange, Directive, Provider, Inject, Optional, Self;
import 'control_value_accessor.dart' show ControlValueAccessor, NG_VALUE_ACCESSOR;
import 'ng_control.dart' show NgControl;
import '../model.dart' show Control;
import '../validators.dart' show NG_VALIDATORS, NG_ASYNC_VALIDATORS;
import 'shared.dart' show setUpControl, isPropertyUpdated, selectValueAccessor, composeValidators, composeAsyncValidators;
import 'validators.dart' show ValidatorFn, AsyncValidatorFn;
import 'package:angular2/src/facade/async.template.dart' as i0;
import 'package:angular2/core.template.dart' as i1;
import 'control_value_accessor.template.dart' as i2;
import 'ng_control.template.dart' as i3;
import '../model.template.dart' as i4;
import '../validators.template.dart' as i5;
import 'shared.template.dart' as i6;
import 'validators.template.dart' as i7;
export 'ng_model.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgModel, new _ngRef.ReflectionInfo(
const [const Directive(bindings: const [formControlBinding], exportAs: "ngForm", inputs: const ["model: ngModel"], outputs: const ["update: ngModelChange"], selector: "[ngModel]:not([ngControl]):not([ngFormControl])")],
const [const [List, const Optional(), const Self(), const Inject(NG_VALIDATORS)], const [List, const Optional(), const Self(), const Inject(NG_ASYNC_VALIDATORS)], const [List, const Optional(), const Self(), const Inject(NG_VALUE_ACCESSOR)]],
(List<dynamic> _validators, List<dynamic> _asyncValidators, List<ControlValueAccessor> valueAccessors) => new NgModel(_validators, _asyncValidators, valueAccessors),
const [OnChanges])
)
..registerGetters({'update': (o) => o.update})
..registerSetters({'model': (o, v) => o.model = v})
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


