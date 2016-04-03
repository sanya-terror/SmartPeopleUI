library angular2.src.testing.test_component_builder.template.dart;

import 'test_component_builder.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/core.dart' show ComponentRef, DirectiveResolver, DynamicComponentLoader, Injector, Injectable, ViewMetadata, ElementRef, EmbeddedViewRef, ViewResolver, provide;
import 'package:angular2/src/facade/lang.dart' show Type, isPresent, isBlank;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, MapWrapper;
import 'package:angular2/src/core/linker/view_ref.dart' show ViewRef_;
import 'package:angular2/src/core/linker/view.dart' show AppView;
import 'utils.dart' show el;
import 'package:angular2/src/platform/dom/dom_tokens.dart' show DOCUMENT;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/core/debug/debug_node.dart' show DebugNode, DebugElement, getDebugNode;
import 'package:angular2/core.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import 'package:angular2/src/facade/collection.template.dart' as i2;
import 'package:angular2/src/core/linker/view_ref.template.dart' as i3;
import 'package:angular2/src/core/linker/view.template.dart' as i4;
import 'utils.template.dart' as i5;
import 'package:angular2/src/platform/dom/dom_tokens.template.dart' as i6;
import 'package:angular2/src/platform/dom/dom_adapter.template.dart' as i7;
import 'package:angular2/src/core/debug/debug_node.template.dart' as i8;
export 'test_component_builder.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(TestComponentBuilder, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [Injector]],
(Injector _injector) => new TestComponentBuilder(_injector))
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
}


