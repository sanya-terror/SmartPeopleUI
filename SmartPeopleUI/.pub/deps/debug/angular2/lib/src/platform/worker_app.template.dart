library angular2.src.platform.worker_app.template.dart;

import 'worker_app.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/zone/ng_zone.dart';
import 'package:angular2/src/platform/server/webworker_adapter.dart';
import 'package:angular2/src/platform/worker_app_common.dart';
import 'package:angular2/core.dart';
import 'package:angular2/src/web_workers/shared/isolate_message_bus.dart';
import 'package:angular2/src/web_workers/shared/message_bus.dart';
import 'dart:isolate';
import 'package:angular2/src/core/zone/ng_zone.template.dart' as i0;
import 'package:angular2/src/platform/server/webworker_adapter.template.dart' as i1;
import 'package:angular2/src/platform/worker_app_common.template.dart' as i2;
import 'package:angular2/core.template.dart' as i3;
import 'package:angular2/src/web_workers/shared/isolate_message_bus.template.dart' as i4;
import 'package:angular2/src/web_workers/shared/message_bus.template.dart' as i5;
export 'worker_app.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}


