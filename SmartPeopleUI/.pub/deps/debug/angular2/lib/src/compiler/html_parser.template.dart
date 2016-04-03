library angular2.src.compiler.html_parser.template.dart;

import 'html_parser.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, StringWrapper, stringify, assertionsEnabled, StringJoiner, serializeEnum;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import 'html_ast.dart' show HtmlAst, HtmlAttrAst, HtmlTextAst, HtmlCommentAst, HtmlElementAst;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'html_lexer.dart' show HtmlToken, HtmlTokenType, tokenizeHtml;
import 'parse_util.dart' show ParseError, ParseLocation, ParseSourceSpan;
import 'html_tags.dart' show HtmlTagDefinition, getHtmlTagDefinition, getNsPrefix, mergeNsAndName;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'html_ast.template.dart' as i2;
import 'package:angular2/src/core/di.template.dart' as i3;
import 'html_lexer.template.dart' as i4;
import 'parse_util.template.dart' as i5;
import 'html_tags.template.dart' as i6;
export 'html_parser.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(HtmlParser, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new HtmlParser())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}


