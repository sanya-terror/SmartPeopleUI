library angular2.src.core.di.injector.template.dart;

import 'injector.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/collection.dart' show Map, MapWrapper, ListWrapper;
import 'provider.dart' show ResolvedProvider, Provider, Dependency, ProviderBuilder, ResolvedFactory, provide, resolveProviders;
import 'exceptions.dart' show AbstractProviderError, NoProviderError, CyclicDependencyError, InstantiationError, InvalidProviderError, OutOfBoundsError;
import 'package:angular2/src/facade/lang.dart' show FunctionWrapper, Type, isPresent, isBlank;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'key.dart' show Key;
import 'metadata.dart' show SelfMetadata, HostMetadata, SkipSelfMetadata;
import 'package:angular2/src/facade/collection.template.dart' as i0;
import 'provider.template.dart' as i1;
import 'exceptions.template.dart' as i2;
import 'package:angular2/src/facade/lang.template.dart' as i3;
import 'package:angular2/src/facade/exceptions.template.dart' as i4;
import 'key.template.dart' as i5;
import 'metadata.template.dart' as i6;
export 'injector.dart';
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
}


