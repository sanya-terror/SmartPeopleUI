library angular2.transform.common.code.reflection_info_code.template.dart;

import 'reflection_info_code.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:analyzer/analyzer.dart';
import 'package:angular2/src/transform/common/annotation_matcher.dart';
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/model/reflection_info_model.pb.dart';
import 'package:angular2/src/transform/common/names.dart';
import 'package:angular2/src/transform/common/property_utils.dart';
import 'package:barback/barback.dart' show AssetId;
import 'annotation_code.dart';
import 'parameter_code.dart';
import 'package:angular2/src/transform/common/annotation_matcher.template.dart' as i0;
import 'package:angular2/src/transform/common/logging.template.dart' as i1;
import 'package:angular2/src/transform/common/model/reflection_info_model.pb.template.dart' as i2;
import 'package:angular2/src/transform/common/names.template.dart' as i3;
import 'package:angular2/src/transform/common/property_utils.template.dart' as i4;
import 'annotation_code.template.dart' as i5;
import 'parameter_code.template.dart' as i6;
export 'reflection_info_code.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}


