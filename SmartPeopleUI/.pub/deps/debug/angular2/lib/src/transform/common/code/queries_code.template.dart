library angular2.transform.common.code.queries_code.template.dart;

import 'queries_code.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:analyzer/analyzer.dart';
import 'package:analyzer/src/generated/ast.dart';
import 'package:angular2/src/transform/common/annotation_matcher.dart';
import 'package:angular2/src/transform/common/naive_eval.dart';
import 'package:barback/barback.dart';
import 'package:angular2/src/transform/common/annotation_matcher.template.dart' as i0;
import 'package:angular2/src/transform/common/naive_eval.template.dart' as i1;
export 'queries_code.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


