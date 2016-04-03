library angular2.src.common.forms.form_builder.template.dart;

import 'form_builder.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show Injectable;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper;
import 'package:angular2/src/facade/lang.dart' show isPresent, isArray, Type;
import 'model.dart' as modelModule;
import 'directives/validators.dart' show ValidatorFn, AsyncValidatorFn;
import 'package:angular2/core.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'package:angular2/src/facade/lang.template.dart' as i2;
import 'model.template.dart' as i3;
import 'directives/validators.template.dart' as i4;
export 'form_builder.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(FormBuilder, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new FormBuilder())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


