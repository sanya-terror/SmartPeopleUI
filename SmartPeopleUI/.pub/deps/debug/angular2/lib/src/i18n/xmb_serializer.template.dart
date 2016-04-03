library angular2.src.i18n.xmb_serializer.template.dart;

import 'xmb_serializer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, RegExpWrapper;
import 'package:angular2/src/compiler/html_ast.dart' show HtmlAst, HtmlElementAst;
import 'message.dart' show Message, id;
import 'package:angular2/src/compiler/html_parser.dart' show HtmlParser;
import 'package:angular2/src/compiler/parse_util.dart' show ParseSourceSpan, ParseError;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/compiler/html_ast.template.dart' as i1;
import 'message.template.dart' as i2;
import 'package:angular2/src/compiler/html_parser.template.dart' as i3;
import 'package:angular2/src/compiler/parse_util.template.dart' as i4;
export 'xmb_serializer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


