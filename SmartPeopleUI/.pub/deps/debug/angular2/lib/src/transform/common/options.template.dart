library angular2.transform.common.options.template.dart;

import 'options.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:glob/glob.dart';
import 'annotation_matcher.dart';
import 'mirror_mode.dart';
import 'package:barback/src/asset/asset_id.dart';
import 'annotation_matcher.template.dart' as i0;
import 'mirror_mode.template.dart' as i1;
export 'options.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


