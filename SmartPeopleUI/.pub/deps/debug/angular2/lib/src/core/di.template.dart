library angular2.src.core.di.template.dart;

import 'di.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'di/metadata.template.dart' as i0;
import 'di/decorators.template.dart' as i1;
import 'di/forward_ref.template.dart' as i2;
import 'di/injector.template.dart' as i3;
import 'di/provider.template.dart' as i4;
import 'di/key.template.dart' as i5;
import 'di/exceptions.template.dart' as i6;
import 'di/opaque_token.template.dart' as i7;
export 'di.dart';
export 'di/metadata.dart' show InjectMetadata, OptionalMetadata, InjectableMetadata, SelfMetadata, HostMetadata, SkipSelfMetadata, DependencyMetadata;
export 'di/decorators.dart';
export 'di/forward_ref.dart' show forwardRef, resolveForwardRef, ForwardRefFn;
export 'di/injector.dart' show Injector;
export 'di/provider.dart' show Binding, ProviderBuilder, ResolvedBinding, ResolvedFactory, Dependency, bind, Provider, ResolvedProvider, provide;
export 'di/key.dart' show Key;
export 'di/exceptions.dart' show NoProviderError, AbstractProviderError, CyclicDependencyError, InstantiationError, InvalidProviderError, NoAnnotationError, OutOfBoundsError;
export 'di/opaque_token.dart' show OpaqueToken;
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


