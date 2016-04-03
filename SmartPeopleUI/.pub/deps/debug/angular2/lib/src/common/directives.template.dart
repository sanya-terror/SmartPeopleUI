library angular2.src.common.directives.template.dart;

import 'directives.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'directives/ng_class.template.dart' as i0;
import 'directives/ng_for.template.dart' as i1;
import 'directives/ng_if.template.dart' as i2;
import 'directives/ng_style.template.dart' as i3;
import 'directives/ng_switch.template.dart' as i4;
import 'directives/ng_plural.template.dart' as i5;
import 'directives/observable_list_diff.template.dart' as i6;
import 'directives/core_directives.template.dart' as i7;
export 'directives.dart';
export 'directives/ng_class.dart' show NgClass;
export 'directives/ng_for.dart' show NgFor;
export 'directives/ng_if.dart' show NgIf;
export 'directives/ng_style.dart' show NgStyle;
export 'directives/ng_switch.dart' show NgSwitch, NgSwitchWhen, NgSwitchDefault;
export 'directives/ng_plural.dart' show NgPlural, NgPluralCase, NgLocalization;
export 'directives/observable_list_diff.dart';
export 'directives/core_directives.dart' show CORE_DIRECTIVES;
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
i7.initReflector();
}


