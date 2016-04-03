library angular2.src.web_workers.shared.generic_message_bus.template.dart;

import 'generic_message_bus.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/src/facade/async.dart' show EventEmitter;
import 'package:angular2/src/web_workers/shared/message_bus.dart' show MessageBus, MessageBusSink, MessageBusSource;
import 'package:angular2/src/core/zone/ng_zone.dart';
import 'package:angular2/src/facade/lang.dart';
import 'package:angular2/src/facade/exceptions.dart';
import 'package:angular2/src/facade/async.template.dart' as i0;
import 'package:angular2/src/web_workers/shared/message_bus.template.dart' as i1;
import 'package:angular2/src/core/zone/ng_zone.template.dart' as i2;
import 'package:angular2/src/facade/lang.template.dart' as i3;
import 'package:angular2/src/facade/exceptions.template.dart' as i4;
export 'generic_message_bus.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


