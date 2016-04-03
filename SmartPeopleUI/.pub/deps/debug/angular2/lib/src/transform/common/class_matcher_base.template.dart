library angular2.transform.common.class_matcher_base.template.dart;

import 'class_matcher_base.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:analyzer/src/generated/ast.dart';
import 'package:barback/barback.dart' show AssetId;
import 'package:path/path.dart' as path;
import 'logging.dart' show log;
import 'url_resolver.dart';
import 'logging.template.dart' as i0;
import 'url_resolver.template.dart' as i1;
export 'class_matcher_base.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


