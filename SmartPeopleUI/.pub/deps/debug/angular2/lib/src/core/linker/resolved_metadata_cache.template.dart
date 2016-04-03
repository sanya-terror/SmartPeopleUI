library angular2.src.core.linker.resolved_metadata_cache.template.dart;

import 'resolved_metadata_cache.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import '../di.dart' show Injectable;
import 'package:angular2/src/facade/lang.dart' show Type, isBlank;
import 'element.dart' show DirectiveProvider;
import 'directive_resolver.dart' show DirectiveResolver, CODEGEN_DIRECTIVE_RESOLVER;
import '../pipes/pipe_provider.dart' show PipeProvider;
import 'pipe_resolver.dart' show PipeResolver, CODEGEN_PIPE_RESOLVER;
import '../di.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import 'element.template.dart' as i2;
import 'directive_resolver.template.dart' as i3;
import '../pipes/pipe_provider.template.dart' as i4;
import 'pipe_resolver.template.dart' as i5;
export 'resolved_metadata_cache.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(ResolvedMetadataCache, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [DirectiveResolver], const [PipeResolver]],
(DirectiveResolver _directiveResolver, PipeResolver _pipeResolver) => new ResolvedMetadataCache(_directiveResolver, _pipeResolver))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}


