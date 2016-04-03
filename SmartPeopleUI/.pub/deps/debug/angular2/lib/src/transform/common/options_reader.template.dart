library angular2.transform.common.options_reader.template.dart;

import 'options_reader.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:barback/barback.dart';
import 'annotation_matcher.dart';
import 'mirror_mode.dart';
import 'options.dart';
import './url_resolver.dart';
import 'annotation_matcher.template.dart' as i0;
import 'mirror_mode.template.dart' as i1;
import 'options.template.dart' as i2;
import './url_resolver.template.dart' as i3;
export 'options_reader.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


