library angular2.platform.worker_app.template.dart;

import 'worker_app.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/platform/worker_app_common.template.dart' as i0;
import 'package:angular2/src/core/angular_entrypoint.template.dart' as i1;
import 'package:angular2/src/platform/worker_app.template.dart' as i2;
import 'package:angular2/src/web_workers/shared/client_message_broker.template.dart' as i3;
import 'package:angular2/src/web_workers/shared/service_message_broker.template.dart' as i4;
import 'package:angular2/src/web_workers/shared/serializer.template.dart' as i5;
import 'package:angular2/src/web_workers/shared/message_bus.template.dart' as i6;
import 'package:angular2/src/web_workers/worker/router_providers.template.dart' as i7;
export 'worker_app.dart';
export 'package:angular2/src/platform/worker_app_common.dart' show WORKER_APP_PLATFORM, WORKER_APP_APPLICATION_COMMON;
export 'package:angular2/src/core/angular_entrypoint.dart' show AngularEntrypoint;
export 'package:angular2/src/platform/worker_app.dart' show WORKER_APP_APPLICATION, RENDER_SEND_PORT;
export 'package:angular2/src/web_workers/shared/client_message_broker.dart' show ClientMessageBroker, ClientMessageBrokerFactory, FnArg, UiArguments;
export 'package:angular2/src/web_workers/shared/service_message_broker.dart' show ReceivedMessage, ServiceMessageBroker, ServiceMessageBrokerFactory;
export 'package:angular2/src/web_workers/shared/serializer.dart' show PRIMITIVE;
export 'package:angular2/src/web_workers/shared/message_bus.dart';
export 'package:angular2/src/web_workers/worker/router_providers.dart' show WORKER_APP_ROUTER;
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
}


