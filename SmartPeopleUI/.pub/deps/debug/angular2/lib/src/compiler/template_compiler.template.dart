library angular2.src.compiler.template_compiler.template.dart;

import 'template_compiler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/src/facade/lang.dart' show IS_DART, Type, Json, isBlank, isPresent, stringify, evalExpression;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, SetWrapper, MapWrapper, StringMapWrapper;
import 'package:angular2/src/facade/async.dart' show PromiseWrapper;
import 'directive_metadata.dart' show createHostComponentMeta, CompileDirectiveMetadata, CompileTypeMetadata, CompileTemplateMetadata, CompilePipeMetadata, CompileMetadataWithType;
import 'template_ast.dart' show TemplateAst, TemplateAstVisitor, NgContentAst, EmbeddedTemplateAst, ElementAst, VariableAst, BoundEventAst, BoundElementPropertyAst, AttrAst, BoundTextAst, TextAst, DirectiveAst, BoundDirectivePropertyAst, templateVisitAll;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'source_module.dart' show SourceModule, moduleRef, SourceExpression;
import 'change_detector_compiler.dart' show ChangeDetectionCompiler, CHANGE_DETECTION_JIT_IMPORTS;
import 'style_compiler.dart' show StyleCompiler;
import 'view_compiler.dart' show ViewCompiler, VIEW_JIT_IMPORTS;
import 'proto_view_compiler.dart' show ProtoViewCompiler, APP_VIEW_MODULE_REF, CompileProtoView, PROTO_VIEW_JIT_IMPORTS;
import 'template_parser.dart' show TemplateParser, PipeCollector;
import 'template_normalizer.dart' show TemplateNormalizer;
import 'runtime_metadata.dart' show RuntimeMetadataResolver;
import 'package:angular2/src/core/linker/view.dart' show HostViewFactory;
import 'package:angular2/src/core/change_detection/change_detection.dart' show ChangeDetectorGenConfig;
import 'package:angular2/src/core/linker/resolved_metadata_cache.dart' show ResolvedMetadataCache;
import 'util.dart' show codeGenExportVariable, escapeSingleQuoteString, codeGenValueFn, MODULE_SUFFIX, addAll, Expression;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/exceptions.template.dart' as i1;
import 'package:angular2/src/facade/collection.template.dart' as i2;
import 'package:angular2/src/facade/async.template.dart' as i3;
import 'directive_metadata.template.dart' as i4;
import 'template_ast.template.dart' as i5;
import 'package:angular2/src/core/di.template.dart' as i6;
import 'source_module.template.dart' as i7;
import 'change_detector_compiler.template.dart' as i8;
import 'style_compiler.template.dart' as i9;
import 'view_compiler.template.dart' as i10;
import 'proto_view_compiler.template.dart' as i11;
import 'template_parser.template.dart' as i12;
import 'template_normalizer.template.dart' as i13;
import 'runtime_metadata.template.dart' as i14;
import 'package:angular2/src/core/linker/view.template.dart' as i15;
import 'package:angular2/src/core/change_detection/change_detection.template.dart' as i16;
import 'package:angular2/src/core/linker/resolved_metadata_cache.template.dart' as i17;
import 'util.template.dart' as i18;
export 'template_compiler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(TemplateCompiler, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [RuntimeMetadataResolver], const [TemplateNormalizer], const [TemplateParser], const [StyleCompiler], const [ChangeDetectionCompiler], const [ProtoViewCompiler], const [ViewCompiler], const [ResolvedMetadataCache], const [ChangeDetectorGenConfig]],
(RuntimeMetadataResolver _runtimeMetadataResolver, TemplateNormalizer _templateNormalizer, TemplateParser _templateParser, StyleCompiler _styleCompiler, ChangeDetectionCompiler _cdCompiler, ProtoViewCompiler _protoViewCompiler, ViewCompiler _viewCompiler, ResolvedMetadataCache _resolvedMetadataCache, ChangeDetectorGenConfig _genConfig) => new TemplateCompiler(_runtimeMetadataResolver, _templateNormalizer, _templateParser, _styleCompiler, _cdCompiler, _protoViewCompiler, _viewCompiler, _resolvedMetadataCache, _genConfig))
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
i17.initReflector();
i18.initReflector();
}


