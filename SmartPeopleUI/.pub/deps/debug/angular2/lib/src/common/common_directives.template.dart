library angular2.src.common.common_directives.template.dart;

import 'common_directives.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type;
import 'forms.dart' show FORM_DIRECTIVES;
import 'directives.dart' show CORE_DIRECTIVES;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'forms.template.dart' as i1;
import 'directives.template.dart' as i2;
export 'common_directives.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerGetters({'update': (o) => o.update, 'ngSubmit': (o) => o.ngSubmit})
..registerSetters({'rawClass': (o, v) => o.rawClass = v, 'initialClasses': (o, v) => o.initialClasses = v, 'ngForTrackBy': (o, v) => o.ngForTrackBy = v, 'ngForOf': (o, v) => o.ngForOf = v, 'ngForTemplate': (o, v) => o.ngForTemplate = v, 'ngIf': (o, v) => o.ngIf = v, 'rawStyle': (o, v) => o.rawStyle = v, 'ngSwitch': (o, v) => o.ngSwitch = v, 'ngSwitchWhen': (o, v) => o.ngSwitchWhen = v, 'ngPlural': (o, v) => o.ngPlural = v, 'name': (o, v) => o.name = v, 'model': (o, v) => o.model = v, 'form': (o, v) => o.form = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


