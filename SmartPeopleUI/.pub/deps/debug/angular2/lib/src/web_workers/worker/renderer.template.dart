library angular2.src.web_workers.worker.renderer.template.dart;

import 'renderer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/render/api.dart' show Renderer, RootRenderer, RenderComponentType, RenderDebugInfo;
import 'package:angular2/src/web_workers/shared/client_message_broker.dart' show ClientMessageBroker, ClientMessageBrokerFactory, FnArg, UiArguments;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, print;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/web_workers/shared/render_store.dart' show RenderStore;
import 'package:angular2/src/web_workers/shared/messaging_api.dart' show RENDERER_CHANNEL;
import 'package:angular2/src/web_workers/shared/serializer.dart' show Serializer, RenderStoreObject;
import 'package:angular2/src/web_workers/shared/messaging_api.dart' show EVENT_CHANNEL;
import 'package:angular2/src/web_workers/shared/message_bus.dart' show MessageBus;
import 'package:angular2/src/facade/async.dart' show EventEmitter, ObservableWrapper;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation;
import 'event_deserializer.dart' show deserializeGenericEvent;
import 'package:angular2/src/core/render/api.template.dart' as i0;
import 'package:angular2/src/web_workers/shared/client_message_broker.template.dart' as i1;
import 'package:angular2/src/facade/lang.template.dart' as i2;
import 'package:angular2/src/facade/collection.template.dart' as i3;
import 'package:angular2/src/core/di.template.dart' as i4;
import 'package:angular2/src/web_workers/shared/render_store.template.dart' as i5;
import 'package:angular2/src/web_workers/shared/messaging_api.template.dart' as i6;
import 'package:angular2/src/web_workers/shared/serializer.template.dart' as i7;
import 'package:angular2/src/web_workers/shared/message_bus.template.dart' as i8;
import 'package:angular2/src/facade/async.template.dart' as i9;
import 'package:angular2/src/core/metadata/view.template.dart' as i10;
import 'event_deserializer.template.dart' as i11;
export 'renderer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(WebWorkerRootRenderer, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [ClientMessageBrokerFactory], const [MessageBus], const [Serializer], const [RenderStore]],
(ClientMessageBrokerFactory messageBrokerFactory, MessageBus bus, Serializer _serializer, RenderStore _renderStore) => new WebWorkerRootRenderer(messageBrokerFactory, bus, _serializer, _renderStore),
const [RootRenderer])
)
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
}


