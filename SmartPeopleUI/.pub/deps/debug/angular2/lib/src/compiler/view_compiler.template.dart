library angular2.src.compiler.view_compiler.template.dart;

import 'view_compiler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, Type, isString, StringWrapper, IS_DART;
import 'package:angular2/src/facade/collection.dart' show SetWrapper, StringMapWrapper, ListWrapper;
import 'template_ast.dart' show TemplateAst, TemplateAstVisitor, NgContentAst, EmbeddedTemplateAst, ElementAst, VariableAst, BoundEventAst, BoundElementPropertyAst, AttrAst, BoundTextAst, TextAst, DirectiveAst, BoundDirectivePropertyAst, templateVisitAll;
import 'directive_metadata.dart' show CompileTypeMetadata, CompileDirectiveMetadata;
import 'source_module.dart' show SourceExpressions, SourceExpression, moduleRef;
import 'package:angular2/src/core/linker/view.dart' show AppProtoView, AppView, flattenNestedViewRenderNodes, checkSlotCount;
import 'package:angular2/src/core/linker/view_type.dart' show ViewType;
import 'package:angular2/src/core/linker/view_manager.dart' show AppViewManager_;
import 'package:angular2/src/core/linker/element.dart' show AppProtoElement, AppElement;
import 'package:angular2/src/core/render/api.dart' show Renderer, ParentRenderer;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation;
import 'util.dart' show escapeSingleQuoteString, codeGenConstConstructorCall, codeGenValueFn, codeGenFnHeader, MODULE_SUFFIX, Statement, escapeValue, codeGenArray, codeGenFlatArray, Expression, flattenArray, CONST_VAR;
import 'package:angular2/src/core/di.dart' show ResolvedProvider, Injectable, Injector;
import 'proto_view_compiler.dart' show APP_VIEW_MODULE_REF, APP_EL_MODULE_REF, METADATA_MODULE_REF, CompileProtoView, CompileProtoElement;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'template_ast.template.dart' as i2;
import 'directive_metadata.template.dart' as i3;
import 'source_module.template.dart' as i4;
import 'package:angular2/src/core/linker/view.template.dart' as i5;
import 'package:angular2/src/core/linker/view_type.template.dart' as i6;
import 'package:angular2/src/core/linker/view_manager.template.dart' as i7;
import 'package:angular2/src/core/linker/element.template.dart' as i8;
import 'package:angular2/src/core/render/api.template.dart' as i9;
import 'package:angular2/src/core/metadata/view.template.dart' as i10;
import 'util.template.dart' as i11;
import 'package:angular2/src/core/di.template.dart' as i12;
import 'proto_view_compiler.template.dart' as i13;
export 'view_compiler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(ViewCompiler, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new ViewCompiler())
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
}


