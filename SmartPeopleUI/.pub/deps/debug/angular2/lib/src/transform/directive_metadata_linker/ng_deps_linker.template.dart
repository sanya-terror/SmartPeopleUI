library angular2.transform.directive_metadata_linker.ng_deps_linker.template.dart;

import 'ng_deps_linker.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/compiler.dart' show UrlResolver;
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/names.dart';
import 'package:angular2/src/transform/common/model/import_export_model.pb.dart';
import 'package:angular2/src/transform/common/model/ng_deps_model.pb.dart';
import 'package:angular2/src/transform/common/url_resolver.dart';
import 'package:barback/barback.dart';
import 'package:angular2/compiler.template.dart' as i0;
import 'package:angular2/src/transform/common/asset_reader.template.dart' as i1;
import 'package:angular2/src/transform/common/logging.template.dart' as i2;
import 'package:angular2/src/transform/common/names.template.dart' as i3;
import 'package:angular2/src/transform/common/model/import_export_model.pb.template.dart' as i4;
import 'package:angular2/src/transform/common/model/ng_deps_model.pb.template.dart' as i5;
import 'package:angular2/src/transform/common/url_resolver.template.dart' as i6;
export 'ng_deps_linker.dart';
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


