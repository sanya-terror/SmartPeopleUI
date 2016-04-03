library angular2.src.web_workers.shared.client_message_broker.template.dart;

import 'client_message_broker.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/src/web_workers/shared/message_bus.dart' show MessageBus;
import 'package:angular2/src/facade/lang.dart' show print, isPresent, DateWrapper, stringify;
import 'package:angular2/src/facade/async.dart' show PromiseCompleter, PromiseWrapper, ObservableWrapper, EventEmitter;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper, MapWrapper;
import 'package:angular2/src/web_workers/shared/serializer.dart' show Serializer;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/facade/lang.dart' show Type, StringWrapper;
import 'package:angular2/src/web_workers/shared/message_bus.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import 'package:angular2/src/facade/async.template.dart' as i2;
import 'package:angular2/src/facade/collection.template.dart' as i3;
import 'package:angular2/src/web_workers/shared/serializer.template.dart' as i4;
import 'package:angular2/src/core/di.template.dart' as i5;
export 'client_message_broker.dart';
export 'package:angular2/src/facade/lang.dart' show Type;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(ClientMessageBrokerFactory_, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [MessageBus], const [Serializer]],
(MessageBus _messageBus, Serializer _serializer) => new ClientMessageBrokerFactory_(_messageBus, _serializer))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}


