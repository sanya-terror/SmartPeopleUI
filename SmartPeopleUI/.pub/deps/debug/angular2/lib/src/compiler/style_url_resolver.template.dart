library angular2.src.compiler.style_url_resolver.template.dart;

import 'style_url_resolver.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show RegExp, RegExpWrapper, StringWrapper, isPresent, isBlank;
import 'package:angular2/src/compiler/url_resolver.dart' show UrlResolver;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/compiler/url_resolver.template.dart' as i1;
export 'style_url_resolver.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


