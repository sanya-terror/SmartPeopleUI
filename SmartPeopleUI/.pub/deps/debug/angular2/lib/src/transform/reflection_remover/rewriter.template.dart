library angular2.transform.reflection_remover.rewriter.template.dart;

import 'rewriter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:analyzer/src/generated/ast.dart';
import 'package:path/path.dart' as path;
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/mirror_matcher.dart';
import 'package:angular2/src/transform/common/mirror_mode.dart';
import 'package:angular2/src/transform/common/names.dart';
import 'codegen.dart';
import 'entrypoint_matcher.dart';
import 'package:angular2/src/transform/common/logging.template.dart' as i0;
import 'package:angular2/src/transform/common/mirror_matcher.template.dart' as i1;
import 'package:angular2/src/transform/common/mirror_mode.template.dart' as i2;
import 'package:angular2/src/transform/common/names.template.dart' as i3;
import 'codegen.template.dart' as i4;
import 'entrypoint_matcher.template.dart' as i5;
export 'rewriter.dart';
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


