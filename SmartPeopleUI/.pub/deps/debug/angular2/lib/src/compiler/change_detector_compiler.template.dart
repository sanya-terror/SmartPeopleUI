library angular2.src.compiler.change_detector_compiler.template.dart;

import 'change_detector_compiler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'directive_metadata.dart' show CompileTypeMetadata;
import 'source_module.dart' show SourceExpressions, moduleRef;
import 'package:angular2/src/core/change_detection/change_detection_jit_generator.dart' show ChangeDetectorJITGenerator;
import 'package:angular2/src/core/change_detection/abstract_change_detector.dart' show AbstractChangeDetector;
import 'package:angular2/src/core/change_detection/change_detection_util.dart' show ChangeDetectionUtil;
import 'package:angular2/src/core/change_detection/constants.dart' show ChangeDetectorState;
import 'change_definition_factory.dart' show createChangeDetectorDefinitions;
import 'package:angular2/src/facade/lang.dart' show IS_DART, isJsObject;
import 'package:angular2/src/core/change_detection/change_detection.dart' show ChangeDetectorGenConfig, ChangeDetectorDefinition, DynamicProtoChangeDetector, ChangeDetectionStrategy;
import 'template_ast.dart' show TemplateAst;
import 'package:angular2/src/transform/template_compiler/change_detector_codegen.dart' show Codegen;
import 'util.dart' show MODULE_SUFFIX;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'directive_metadata.template.dart' as i0;
import 'source_module.template.dart' as i1;
import 'package:angular2/src/core/change_detection/change_detection_jit_generator.template.dart' as i2;
import 'package:angular2/src/core/change_detection/abstract_change_detector.template.dart' as i3;
import 'package:angular2/src/core/change_detection/change_detection_util.template.dart' as i4;
import 'package:angular2/src/core/change_detection/constants.template.dart' as i5;
import 'change_definition_factory.template.dart' as i6;
import 'package:angular2/src/facade/lang.template.dart' as i7;
import 'package:angular2/src/core/change_detection/change_detection.template.dart' as i8;
import 'template_ast.template.dart' as i9;
import 'package:angular2/src/transform/template_compiler/change_detector_codegen.template.dart' as i10;
import 'util.template.dart' as i11;
import 'package:angular2/src/core/di.template.dart' as i12;
export 'change_detector_compiler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(ChangeDetectionCompiler, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [ChangeDetectorGenConfig]],
(ChangeDetectorGenConfig _genConfig) => new ChangeDetectionCompiler(_genConfig))
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
}


