library angular2.transform.directive_processor.inliner.template.dart;

import 'inliner.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:analyzer/analyzer.dart';
import 'package:analyzer/src/generated/ast.dart';
import 'package:barback/barback.dart' show AssetId;
import 'package:source_span/source_span.dart';
import 'package:path/path.dart' as path;
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/async_string_writer.dart';
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/url_resolver.dart';
import 'package:angular2/src/transform/common/asset_reader.template.dart' as i0;
import 'package:angular2/src/transform/common/async_string_writer.template.dart' as i1;
import 'package:angular2/src/transform/common/logging.template.dart' as i2;
import 'package:angular2/src/transform/common/url_resolver.template.dart' as i3;
export 'inliner.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


