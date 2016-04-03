library angular2.transform.directive_metadata_linker.transformer.template.dart;

import 'transformer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'dart:convert';
import 'package:barback/barback.dart';
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/names.dart';
import 'package:angular2/src/transform/common/zone.dart' as zone;
import 'ng_meta_linker.dart';
import 'package:angular2/src/transform/common/asset_reader.template.dart' as i0;
import 'package:angular2/src/transform/common/names.template.dart' as i1;
import 'package:angular2/src/transform/common/zone.template.dart' as i2;
import 'ng_meta_linker.template.dart' as i3;
export 'transformer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


