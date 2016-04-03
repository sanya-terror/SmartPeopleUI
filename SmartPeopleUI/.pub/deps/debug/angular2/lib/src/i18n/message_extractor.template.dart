library angular2.src.i18n.message_extractor.template.dart;

import 'message_extractor.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/compiler/html_parser.dart' show HtmlParser;
import 'package:angular2/src/compiler/parse_util.dart' show ParseSourceSpan, ParseError;
import 'package:angular2/src/compiler/html_ast.dart' show HtmlAst, HtmlAstVisitor, HtmlElementAst, HtmlAttrAst, HtmlTextAst, HtmlCommentAst, htmlVisitAll;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper;
import 'package:angular2/src/core/change_detection/parser/parser.dart' show Parser;
import 'message.dart' show Message, id;
import 'shared.dart' show I18nError, Part, I18N_ATTR_PREFIX, partition, meaning, description, stringifyNodes, messageFromAttribute;
import 'package:angular2/src/compiler/html_parser.template.dart' as i0;
import 'package:angular2/src/compiler/parse_util.template.dart' as i1;
import 'package:angular2/src/compiler/html_ast.template.dart' as i2;
import 'package:angular2/src/facade/lang.template.dart' as i3;
import 'package:angular2/src/facade/collection.template.dart' as i4;
import 'package:angular2/src/core/change_detection/parser/parser.template.dart' as i5;
import 'message.template.dart' as i6;
import 'shared.template.dart' as i7;
export 'message_extractor.dart';
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
}


