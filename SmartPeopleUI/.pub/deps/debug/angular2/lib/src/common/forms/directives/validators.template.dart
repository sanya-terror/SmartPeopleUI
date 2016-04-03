library angular2.src.common.forms.directives.validators.template.dart;

import 'validators.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show Provider, Attribute, Directive;
import '../validators.dart' show Validators, NG_VALIDATORS;
import '../model.dart' show AbstractControl;
import '../model.dart' as modelModule;
import 'package:angular2/src/facade/lang.dart' show NumberWrapper;
import 'package:angular2/core.template.dart' as i0;
import '../validators.template.dart' as i1;
import '../model.template.dart' as i2;
import 'package:angular2/src/facade/lang.template.dart' as i3;
export 'validators.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(RequiredValidator, new _ngRef.ReflectionInfo(
const [const Directive(providers: const [REQUIRED_VALIDATOR], selector: "[required][ngControl],[required][ngFormControl],[required][ngModel]")],
const [],
() => new RequiredValidator())
)
..registerType(MinLengthValidator, new _ngRef.ReflectionInfo(
const [const Directive(providers: const [MIN_LENGTH_VALIDATOR], selector: "[minlength][ngControl],[minlength][ngFormControl],[minlength][ngModel]")],
const [const [String, const Attribute("minlength")]],
(String minLength) => new MinLengthValidator(minLength),
const [Validator])
)
..registerType(MaxLengthValidator, new _ngRef.ReflectionInfo(
const [const Directive(providers: const [MAX_LENGTH_VALIDATOR], selector: "[maxlength][ngControl],[maxlength][ngFormControl],[maxlength][ngModel]")],
const [const [String, const Attribute("maxlength")]],
(String maxLength) => new MaxLengthValidator(maxLength),
const [Validator])
)
..registerType(PatternValidator, new _ngRef.ReflectionInfo(
const [const Directive(providers: const [PATTERN_VALIDATOR], selector: "[pattern][ngControl],[pattern][ngFormControl],[pattern][ngModel]")],
const [const [String, const Attribute("pattern")]],
(String pattern) => new PatternValidator(pattern),
const [Validator])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


