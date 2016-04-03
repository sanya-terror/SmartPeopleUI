library angular2.transform.directive_processor.rewriter.template.dart;

import 'rewriter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:analyzer/analyzer.dart';
import 'package:barback/barback.dart' show AssetId;
import 'package:angular2/src/compiler/directive_metadata.dart' show CompileIdentifierMetadata;
import 'package:angular2/src/compiler/template_compiler.dart';
import 'package:angular2/src/transform/common/annotation_matcher.dart';
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/code/ng_deps_code.dart';
import 'package:angular2/src/transform/common/type_metadata_reader.dart';
import 'package:angular2/src/transform/common/interface_matcher.dart';
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/ng_compiler.dart';
import 'package:angular2/src/transform/common/ng_meta.dart';
import 'package:angular2/src/transform/common/url_resolver.dart';
import 'package:angular2/src/transform/common/zone.dart' as zone;
import 'inliner.dart';
import 'package:angular2/src/compiler/directive_metadata.template.dart' as i0;
import 'package:angular2/src/compiler/template_compiler.template.dart' as i1;
import 'package:angular2/src/transform/common/annotation_matcher.template.dart' as i2;
import 'package:angular2/src/transform/common/asset_reader.template.dart' as i3;
import 'package:angular2/src/transform/common/code/ng_deps_code.template.dart' as i4;
import 'package:angular2/src/transform/common/type_metadata_reader.template.dart' as i5;
import 'package:angular2/src/transform/common/interface_matcher.template.dart' as i6;
import 'package:angular2/src/transform/common/logging.template.dart' as i7;
import 'package:angular2/src/transform/common/ng_compiler.template.dart' as i8;
import 'package:angular2/src/transform/common/ng_meta.template.dart' as i9;
import 'package:angular2/src/transform/common/url_resolver.template.dart' as i10;
import 'package:angular2/src/transform/common/zone.template.dart' as i11;
import 'inliner.template.dart' as i12;
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
i6.initReflector();
i7.initReflector();
i8.initReflector();
i9.initReflector();
i10.initReflector();
i11.initReflector();
i12.initReflector();
}


