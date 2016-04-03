library angular2.src.common.directives.core_directives.template.dart;

import 'core_directives.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type;
import 'ng_class.dart' show NgClass;
import 'ng_for.dart' show NgFor;
import 'ng_if.dart' show NgIf;
import 'ng_style.dart' show NgStyle;
import 'ng_switch.dart' show NgSwitch, NgSwitchWhen, NgSwitchDefault;
import 'ng_plural.dart' show NgPlural, NgPluralCase;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'ng_class.template.dart' as i1;
import 'ng_for.template.dart' as i2;
import 'ng_if.template.dart' as i3;
import 'ng_style.template.dart' as i4;
import 'ng_switch.template.dart' as i5;
import 'ng_plural.template.dart' as i6;
export 'core_directives.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerSetters({'rawClass': (o, v) => o.rawClass = v, 'initialClasses': (o, v) => o.initialClasses = v, 'ngForTrackBy': (o, v) => o.ngForTrackBy = v, 'ngForOf': (o, v) => o.ngForOf = v, 'ngForTemplate': (o, v) => o.ngForTemplate = v, 'ngIf': (o, v) => o.ngIf = v, 'rawStyle': (o, v) => o.rawStyle = v, 'ngSwitch': (o, v) => o.ngSwitch = v, 'ngSwitchWhen': (o, v) => o.ngSwitchWhen = v, 'ngPlural': (o, v) => o.ngPlural = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}


