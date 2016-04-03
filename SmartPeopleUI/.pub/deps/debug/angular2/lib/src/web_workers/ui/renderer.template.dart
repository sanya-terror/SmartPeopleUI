library angular2.src.web_workers.ui.renderer.template.dart;

import 'renderer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/web_workers/shared/message_bus.dart' show MessageBus;
import 'package:angular2/src/web_workers/shared/serializer.dart' show Serializer, PRIMITIVE, RenderStoreObject;
import 'package:angular2/src/core/render/api.dart' show RootRenderer, Renderer, RenderComponentType;
import 'package:angular2/src/web_workers/shared/messaging_api.dart' show EVENT_CHANNEL, RENDERER_CHANNEL;
import 'package:angular2/src/facade/lang.dart' show Type;
import 'bind.dart' show bind;
import 'package:angular2/src/web_workers/ui/event_dispatcher.dart' show EventDispatcher;
import 'package:angular2/src/web_workers/shared/render_store.dart' show RenderStore;
import 'package:angular2/src/web_workers/shared/service_message_broker.dart' show ServiceMessageBrokerFactory;
import 'package:angular2/src/core/di.template.dart' as i0;
import 'package:angular2/src/web_workers/shared/message_bus.template.dart' as i1;
import 'package:angular2/src/web_workers/shared/serializer.template.dart' as i2;
import 'package:angular2/src/core/render/api.template.dart' as i3;
import 'package:angular2/src/web_workers/shared/messaging_api.template.dart' as i4;
import 'package:angular2/src/facade/lang.template.dart' as i5;
import 'package:angular2/src/web_workers/ui/event_dispatcher.template.dart' as i6;
import 'package:angular2/src/web_workers/shared/render_store.template.dart' as i7;
import 'package:angular2/src/web_workers/shared/service_message_broker.template.dart' as i8;
export 'renderer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(MessageBasedRenderer, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [ServiceMessageBrokerFactory], const [MessageBus], const [Serializer], const [RenderStore], const [RootRenderer]],
(ServiceMessageBrokerFactory _brokerFactory, MessageBus _bus, Serializer _serializer, RenderStore _renderStore, RootRenderer _rootRenderer) => new MessageBasedRenderer(_brokerFactory, _bus, _serializer, _renderStore, _rootRenderer))
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
}


