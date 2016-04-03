library angular2.src.compiler.template_normalizer.template.dart;

import 'template_normalizer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'directive_metadata.dart' show CompileTypeMetadata, CompileDirectiveMetadata, CompileTemplateMetadata;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/async.dart' show PromiseWrapper;
import 'package:angular2/src/compiler/xhr.dart' show XHR;
import 'package:angular2/src/compiler/url_resolver.dart' show UrlResolver;
import 'style_url_resolver.dart' show extractStyleUrls, isStyleUrlResolvable;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation;
import 'html_ast.dart' show HtmlAstVisitor, HtmlElementAst, HtmlTextAst, HtmlAttrAst, HtmlAst, HtmlCommentAst, htmlVisitAll;
import 'html_parser.dart' show HtmlParser;
import 'template_preparser.dart' show preparseElement, PreparsedElement, PreparsedElementType;
import 'directive_metadata.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import 'package:angular2/src/facade/exceptions.template.dart' as i2;
import 'package:angular2/src/facade/async.template.dart' as i3;
import 'package:angular2/src/compiler/xhr.template.dart' as i4;
import 'package:angular2/src/compiler/url_resolver.template.dart' as i5;
import 'style_url_resolver.template.dart' as i6;
import 'package:angular2/src/core/di.template.dart' as i7;
import 'package:angular2/src/core/metadata/view.template.dart' as i8;
import 'html_ast.template.dart' as i9;
import 'html_parser.template.dart' as i10;
import 'template_preparser.template.dart' as i11;
export 'template_normalizer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(TemplateNormalizer, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [XHR], const [UrlResolver], const [HtmlParser]],
(XHR _xhr, UrlResolver _urlResolver, HtmlParser _htmlParser) => new TemplateNormalizer(_xhr, _urlResolver, _htmlParser))
)
;
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
}


