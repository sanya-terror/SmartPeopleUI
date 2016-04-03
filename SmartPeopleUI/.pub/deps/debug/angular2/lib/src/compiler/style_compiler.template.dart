library angular2.src.compiler.style_compiler.template.dart;

import 'style_compiler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'directive_metadata.dart' show CompileTypeMetadata, CompileTemplateMetadata;
import 'source_module.dart' show SourceModule, SourceExpression, moduleRef;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation;
import 'package:angular2/src/compiler/xhr.dart' show XHR;
import 'package:angular2/src/facade/lang.dart' show IS_DART, StringWrapper, isBlank;
import 'package:angular2/src/facade/async.dart' show PromiseWrapper;
import 'package:angular2/src/compiler/shadow_css.dart' show ShadowCss;
import 'package:angular2/src/compiler/url_resolver.dart' show UrlResolver;
import 'style_url_resolver.dart' show extractStyleUrls;
import 'util.dart' show escapeSingleQuoteString, codeGenExportVariable, codeGenToString, MODULE_SUFFIX;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'directive_metadata.template.dart' as i0;
import 'source_module.template.dart' as i1;
import 'package:angular2/src/core/metadata/view.template.dart' as i2;
import 'package:angular2/src/compiler/xhr.template.dart' as i3;
import 'package:angular2/src/facade/lang.template.dart' as i4;
import 'package:angular2/src/facade/async.template.dart' as i5;
import 'package:angular2/src/compiler/shadow_css.template.dart' as i6;
import 'package:angular2/src/compiler/url_resolver.template.dart' as i7;
import 'style_url_resolver.template.dart' as i8;
import 'util.template.dart' as i9;
import 'package:angular2/src/core/di.template.dart' as i10;
export 'style_compiler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(StyleCompiler, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [XHR], const [UrlResolver]],
(XHR _xhr, UrlResolver _urlResolver) => new StyleCompiler(_xhr, _urlResolver))
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


