library angular2.src.i18n.i18n_html_parser.template.dart;

import 'i18n_html_parser.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/compiler/html_parser.dart' show HtmlParser, HtmlParseTreeResult;
import 'package:angular2/src/compiler/parse_util.dart' show ParseSourceSpan, ParseError;
import 'package:angular2/src/compiler/html_ast.dart' show HtmlAst, HtmlAstVisitor, HtmlElementAst, HtmlAttrAst, HtmlTextAst, HtmlCommentAst, htmlVisitAll;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, StringMapWrapper;
import 'package:angular2/src/facade/lang.dart' show RegExpWrapper, NumberWrapper, isPresent;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/change_detection/parser/parser.dart' show Parser;
import 'message.dart' show Message, id;
import 'shared.dart' show messageFromAttribute, I18nError, I18N_ATTR_PREFIX, I18N_ATTR, partition, Part, stringifyNodes, meaning;
import 'package:angular2/src/compiler/html_parser.template.dart' as i0;
import 'package:angular2/src/compiler/parse_util.template.dart' as i1;
import 'package:angular2/src/compiler/html_ast.template.dart' as i2;
import 'package:angular2/src/facade/collection.template.dart' as i3;
import 'package:angular2/src/facade/lang.template.dart' as i4;
import 'package:angular2/src/facade/exceptions.template.dart' as i5;
import 'package:angular2/src/core/change_detection/parser/parser.template.dart' as i6;
import 'message.template.dart' as i7;
import 'shared.template.dart' as i8;
export 'i18n_html_parser.dart';
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
}


