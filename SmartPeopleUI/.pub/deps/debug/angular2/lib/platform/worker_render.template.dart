library angular2.platform.worker_render.template.dart;

import 'worker_render.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/platform/worker_render_common.dart';
import 'package:angular2/src/platform/worker_render_common.template.dart' as i0;
import 'package:angular2/src/platform/worker_render.template.dart' as i1;
import '../src/web_workers/shared/client_message_broker.template.dart' as i2;
import '../src/web_workers/shared/service_message_broker.template.dart' as i3;
import '../src/web_workers/shared/serializer.template.dart' as i4;
import '../src/web_workers/shared/message_bus.template.dart' as i5;
import '../src/web_workers/ui/router_providers.template.dart' as i6;
export 'worker_render.dart';
export 'package:angular2/src/platform/worker_render_common.dart' show WORKER_SCRIPT, WORKER_RENDER_PLATFORM, WORKER_RENDER_APPLICATION_COMMON, initializeGenericWorkerRenderer;
export 'package:angular2/src/platform/worker_render.dart' show WORKER_RENDER_APPLICATION, initIsolate, WebWorkerInstance;
export '../src/web_workers/shared/client_message_broker.dart' show ClientMessageBroker, ClientMessageBrokerFactory, FnArg, UiArguments;
export '../src/web_workers/shared/service_message_broker.dart' show ReceivedMessage, ServiceMessageBroker, ServiceMessageBrokerFactory;
export '../src/web_workers/shared/serializer.dart' show PRIMITIVE;
export '../src/web_workers/shared/message_bus.dart';
export '../src/web_workers/ui/router_providers.dart' show WORKER_RENDER_ROUTER;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}


