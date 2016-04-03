import 'extract_messages.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:build/build.dart';
import 'package:analyzer/src/generated/element.dart';
import 'src/transform/common/url_resolver.dart';
import 'dart:async';
import 'package:angular2/i18n.dart';
import 'package:angular2/src/core/change_detection/parser/parser.dart';
import 'package:angular2/src/core/change_detection/parser/lexer.dart';
import 'package:angular2/src/core/reflection/reflector.dart';
import 'package:angular2/src/compiler/html_parser.dart';
import 'src/transform/common/url_resolver.template.dart' as i0;
import 'package:angular2/i18n.template.dart' as i1;
import 'package:angular2/src/core/change_detection/parser/parser.template.dart' as i2;
import 'package:angular2/src/core/change_detection/parser/lexer.template.dart' as i3;
import 'package:angular2/src/core/reflection/reflector.template.dart' as i4;
import 'package:angular2/src/compiler/html_parser.template.dart' as i5;
export 'extract_messages.dart';
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


