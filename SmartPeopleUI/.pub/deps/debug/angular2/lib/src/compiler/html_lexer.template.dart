library angular2.src.compiler.html_lexer.template.dart;

import 'html_lexer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show StringWrapper, NumberWrapper, isPresent, isBlank, serializeEnum;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import 'parse_util.dart' show ParseLocation, ParseError, ParseSourceFile, ParseSourceSpan;
import 'html_tags.dart' show getHtmlTagDefinition, HtmlTagContentType, NAMED_ENTITIES;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'parse_util.template.dart' as i2;
import 'html_tags.template.dart' as i3;
export 'html_lexer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


