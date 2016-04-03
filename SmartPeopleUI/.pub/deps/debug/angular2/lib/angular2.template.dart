library angular2.template.dart;

import 'angular2.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.template.dart' as i0;
import 'package:angular2/common.template.dart' as i1;
import 'package:angular2/instrumentation.template.dart' as i2;
import 'package:angular2/src/core/angular_entrypoint.template.dart' as i3;
import 'package:angular2/src/core/application_tokens.template.dart' as i4;
import 'package:angular2/src/platform/dom/dom_tokens.template.dart' as i5;
import 'package:angular2/src/platform/dom/dom_adapter.template.dart' as i6;
import 'package:angular2/src/platform/dom/events/event_manager.template.dart' as i7;
import 'package:angular2/src/compiler/url_resolver.template.dart' as i8;
export 'angular2.dart';
export 'package:angular2/core.dart';
export 'package:angular2/common.dart';
export 'package:angular2/instrumentation.dart';
export 'package:angular2/src/core/angular_entrypoint.dart' show AngularEntrypoint;
export 'package:angular2/src/core/application_tokens.dart' hide APP_COMPONENT_REF_PROMISE, APP_ID_RANDOM_PROVIDER;
export 'package:angular2/src/platform/dom/dom_tokens.dart';
export 'package:angular2/src/platform/dom/dom_adapter.dart';
export 'package:angular2/src/platform/dom/events/event_manager.dart';
export 'package:angular2/src/compiler/url_resolver.dart';
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
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
}


