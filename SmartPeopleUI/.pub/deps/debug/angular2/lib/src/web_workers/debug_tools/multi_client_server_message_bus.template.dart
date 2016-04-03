library angular2.src.web_workers.debug_tools.multi_client_server_message_bus.template.dart;

import 'multi_client_server_message_bus.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:io';
import 'dart:convert' show JSON;
import 'dart:async';
import 'package:angular2/src/web_workers/shared/messaging_api.dart';
import 'package:angular2/src/web_workers/shared/generic_message_bus.dart';
import 'package:angular2/src/web_workers/shared/messaging_api.template.dart' as i0;
import 'package:angular2/src/web_workers/shared/generic_message_bus.template.dart' as i1;
export 'multi_client_server_message_bus.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


