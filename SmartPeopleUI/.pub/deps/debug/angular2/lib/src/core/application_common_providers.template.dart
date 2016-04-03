library angular2.src.core.application_common_providers.template.dart;

import 'application_common_providers.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type;
import 'package:angular2/src/core/di.dart' show provide, Provider, Injector, OpaqueToken;
import 'application_tokens.dart' show APP_COMPONENT_REF_PROMISE, APP_COMPONENT, APP_ID_RANDOM_PROVIDER;
import 'change_detection/change_detection.dart' show IterableDiffers, defaultIterableDiffers, KeyValueDiffers, defaultKeyValueDiffers;
import 'package:angular2/src/core/linker/resolved_metadata_cache.dart' show ResolvedMetadataCache;
import 'linker/view_manager.dart' show AppViewManager;
import 'linker/view_manager.dart' show AppViewManager_;
import 'linker/view_resolver.dart' show ViewResolver;
import 'linker/directive_resolver.dart' show DirectiveResolver;
import 'linker/pipe_resolver.dart' show PipeResolver;
import 'linker/compiler.dart' show Compiler;
import 'linker/compiler.dart' show Compiler_;
import 'linker/dynamic_component_loader.dart' show DynamicComponentLoader;
import 'linker/dynamic_component_loader.dart' show DynamicComponentLoader_;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/core/di.template.dart' as i1;
import 'application_tokens.template.dart' as i2;
import 'change_detection/change_detection.template.dart' as i3;
import 'package:angular2/src/core/linker/resolved_metadata_cache.template.dart' as i4;
import 'linker/view_manager.template.dart' as i5;
import 'linker/view_resolver.template.dart' as i6;
import 'linker/directive_resolver.template.dart' as i7;
import 'linker/pipe_resolver.template.dart' as i8;
import 'linker/compiler.template.dart' as i9;
import 'linker/dynamic_component_loader.template.dart' as i10;
export 'application_common_providers.dart';
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
i9.initReflector();
i10.initReflector();
}


