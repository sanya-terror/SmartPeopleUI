library angular2.src.platform.worker_app_common.template.dart;

import 'worker_app_common.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/compiler/xhr.dart' show XHR;
import 'package:angular2/src/web_workers/worker/xhr_impl.dart' show WebWorkerXHRImpl;
import 'package:angular2/src/web_workers/worker/renderer.dart' show WebWorkerRootRenderer;
import 'package:angular2/src/facade/lang.dart' show print, Type, isPresent;
import 'package:angular2/src/core/render/api.dart' show RootRenderer;
import 'package:angular2/core.dart' show PLATFORM_DIRECTIVES, PLATFORM_PIPES, ExceptionHandler, APPLICATION_COMMON_PROVIDERS, PLATFORM_COMMON_PROVIDERS;
import 'package:angular2/common.dart' show COMMON_DIRECTIVES, COMMON_PIPES, FORM_PROVIDERS;
import 'package:angular2/src/web_workers/shared/client_message_broker.dart' show ClientMessageBrokerFactory, ClientMessageBrokerFactory_;
import 'package:angular2/src/web_workers/shared/service_message_broker.dart' show ServiceMessageBrokerFactory, ServiceMessageBrokerFactory_;
import 'package:angular2/src/web_workers/shared/serializer.dart' show Serializer;
import 'package:angular2/src/web_workers/shared/api.dart' show ON_WEB_WORKER;
import 'package:angular2/src/core/di.dart' show Provider;
import 'package:angular2/src/web_workers/shared/render_store.dart' show RenderStore;
import 'package:angular2/src/compiler/xhr.template.dart' as i0;
import 'package:angular2/src/web_workers/worker/xhr_impl.template.dart' as i1;
import 'package:angular2/src/web_workers/worker/renderer.template.dart' as i2;
import 'package:angular2/src/facade/lang.template.dart' as i3;
import 'package:angular2/src/core/render/api.template.dart' as i4;
import 'package:angular2/core.template.dart' as i5;
import 'package:angular2/common.template.dart' as i6;
import 'package:angular2/src/web_workers/shared/client_message_broker.template.dart' as i7;
import 'package:angular2/src/web_workers/shared/service_message_broker.template.dart' as i8;
import 'package:angular2/src/web_workers/shared/serializer.template.dart' as i9;
import 'package:angular2/src/web_workers/shared/api.template.dart' as i10;
import 'package:angular2/src/core/di.template.dart' as i11;
import 'package:angular2/src/web_workers/shared/render_store.template.dart' as i12;
export 'worker_app_common.dart';
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
i9.initReflector();
i10.initReflector();
i11.initReflector();
i12.initReflector();
}


