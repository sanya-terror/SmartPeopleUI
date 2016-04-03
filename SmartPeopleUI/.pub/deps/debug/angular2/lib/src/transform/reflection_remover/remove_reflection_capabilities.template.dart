library angular2.transform.reflection_remover.remove_reflection_capabilities.template.dart;

import 'remove_reflection_capabilities.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:analyzer/analyzer.dart';
import 'package:barback/barback.dart';
import 'package:angular2/src/transform/common/annotation_matcher.dart';
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/mirror_mode.dart';
import 'codegen.dart';
import 'entrypoint_matcher.dart';
import 'rewriter.dart';
import 'package:angular2/src/transform/common/annotation_matcher.template.dart' as i0;
import 'package:angular2/src/transform/common/asset_reader.template.dart' as i1;
import 'package:angular2/src/transform/common/mirror_mode.template.dart' as i2;
import 'codegen.template.dart' as i3;
import 'entrypoint_matcher.template.dart' as i4;
import 'rewriter.template.dart' as i5;
export 'remove_reflection_capabilities.dart';
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


