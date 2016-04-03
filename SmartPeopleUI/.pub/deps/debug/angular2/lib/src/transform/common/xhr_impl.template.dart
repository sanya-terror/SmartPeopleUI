library angular2.transform.template_compiler.xhr_impl.template.dart;

import 'xhr_impl.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/src/compiler/xhr.dart' show XHR;
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/url_resolver.dart';
import 'package:angular2/src/compiler/xhr.template.dart' as i0;
import 'package:angular2/src/transform/common/asset_reader.template.dart' as i1;
import 'package:angular2/src/transform/common/logging.template.dart' as i2;
import 'package:angular2/src/transform/common/url_resolver.template.dart' as i3;
export 'xhr_impl.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


