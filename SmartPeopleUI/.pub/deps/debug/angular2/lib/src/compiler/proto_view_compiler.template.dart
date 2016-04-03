library angular2.src.compiler.proto_view_compiler.template.dart;

import 'proto_view_compiler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, Type, isString, StringWrapper, IS_DART;
import 'package:angular2/src/facade/collection.dart' show SetWrapper, StringMapWrapper, ListWrapper, MapWrapper;
import 'template_ast.dart' show TemplateAst, TemplateAstVisitor, NgContentAst, EmbeddedTemplateAst, ElementAst, VariableAst, BoundEventAst, BoundElementPropertyAst, AttrAst, BoundTextAst, TextAst, DirectiveAst, BoundDirectivePropertyAst, templateVisitAll;
import 'directive_metadata.dart' show CompileTypeMetadata, CompileDirectiveMetadata, CompilePipeMetadata;
import 'source_module.dart' show SourceExpressions, SourceExpression, moduleRef;
import 'package:angular2/src/core/linker/view.dart' show AppProtoView, AppView;
import 'package:angular2/src/core/linker/view_type.dart' show ViewType;
import 'package:angular2/src/core/linker/element.dart' show AppProtoElement, AppElement;
import 'package:angular2/src/core/linker/resolved_metadata_cache.dart' show ResolvedMetadataCache;
import 'util.dart' show escapeSingleQuoteString, codeGenConstConstructorCall, codeGenValueFn, codeGenFnHeader, MODULE_SUFFIX, codeGenStringMap, Expression, Statement;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/collection.template.dart' as i1;
import 'template_ast.template.dart' as i2;
import 'directive_metadata.template.dart' as i3;
import 'source_module.template.dart' as i4;
import 'package:angular2/src/core/linker/view.template.dart' as i5;
import 'package:angular2/src/core/linker/view_type.template.dart' as i6;
import 'package:angular2/src/core/linker/element.template.dart' as i7;
import 'package:angular2/src/core/linker/resolved_metadata_cache.template.dart' as i8;
import 'util.template.dart' as i9;
import 'package:angular2/src/core/di.template.dart' as i10;
export 'proto_view_compiler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(ProtoViewCompiler, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new ProtoViewCompiler())
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
}


