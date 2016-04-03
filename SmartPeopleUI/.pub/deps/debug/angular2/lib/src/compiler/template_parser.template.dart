library angular2.src.compiler.template_parser.template.dart;

import 'template_parser.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, StringMapWrapper, SetWrapper;
import 'package:angular2/src/facade/lang.dart' show RegExpWrapper, isPresent, StringWrapper, isBlank;
import 'package:angular2/core.dart' show Injectable, Inject, OpaqueToken, Optional;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/change_detection/change_detection.dart' show Parser, AST, ASTWithSource;
import 'package:angular2/src/core/change_detection/parser/ast.dart' show TemplateBinding;
import 'directive_metadata.dart' show CompileDirectiveMetadata, CompilePipeMetadata;
import 'html_parser.dart' show HtmlParser;
import 'html_tags.dart' show splitNsName, mergeNsAndName;
import 'parse_util.dart' show ParseSourceSpan, ParseError, ParseLocation;
import 'package:angular2/src/core/change_detection/parser/ast.dart' show RecursiveAstVisitor, BindingPipe;
import 'template_ast.dart' show ElementAst, BoundElementPropertyAst, BoundEventAst, VariableAst, TemplateAst, TemplateAstVisitor, templateVisitAll, TextAst, BoundTextAst, EmbeddedTemplateAst, AttrAst, NgContentAst, PropertyBindingType, DirectiveAst, BoundDirectivePropertyAst;
import 'package:angular2/src/compiler/selector.dart' show CssSelector, SelectorMatcher;
import 'package:angular2/src/compiler/schema/element_schema_registry.dart' show ElementSchemaRegistry;
import 'template_preparser.dart' show preparseElement, PreparsedElement, PreparsedElementType;
import 'style_url_resolver.dart' show isStyleUrlResolvable;
import 'html_ast.dart' show HtmlAstVisitor, HtmlAst, HtmlElementAst, HtmlAttrAst, HtmlTextAst, HtmlCommentAst, htmlVisitAll;
import 'util.dart' show splitAtColon;
import 'package:angular2/src/facade/collection.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import 'package:angular2/core.template.dart' as i2;
import 'package:angular2/src/facade/exceptions.template.dart' as i3;
import 'package:angular2/src/core/change_detection/change_detection.template.dart' as i4;
import 'package:angular2/src/core/change_detection/parser/ast.template.dart' as i5;
import 'directive_metadata.template.dart' as i6;
import 'html_parser.template.dart' as i7;
import 'html_tags.template.dart' as i8;
import 'parse_util.template.dart' as i9;
import 'template_ast.template.dart' as i10;
import 'package:angular2/src/compiler/selector.template.dart' as i11;
import 'package:angular2/src/compiler/schema/element_schema_registry.template.dart' as i12;
import 'template_preparser.template.dart' as i13;
import 'style_url_resolver.template.dart' as i14;
import 'html_ast.template.dart' as i15;
import 'util.template.dart' as i16;
export 'template_parser.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(TemplateParser, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [Parser], const [ElementSchemaRegistry], const [HtmlParser], const [List, const Optional(), const Inject(TEMPLATE_TRANSFORMS)]],
(Parser _exprParser, ElementSchemaRegistry _schemaRegistry, HtmlParser _htmlParser, List<TemplateAstVisitor> transforms) => new TemplateParser(_exprParser, _schemaRegistry, _htmlParser, transforms))
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
i12.initReflector();
i13.initReflector();
i14.initReflector();
i15.initReflector();
i16.initReflector();
}


