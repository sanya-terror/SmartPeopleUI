library angular2.src.core.linker.template.dart;

import 'linker.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'linker/interfaces.template.dart' as i0;
import 'linker/directive_resolver.template.dart' as i1;
import 'linker/view_resolver.template.dart' as i2;
import 'linker/compiler.template.dart' as i3;
import 'linker/view_manager.template.dart' as i4;
import 'linker/query_list.template.dart' as i5;
import 'linker/dynamic_component_loader.template.dart' as i6;
import 'linker/element_ref.template.dart' as i7;
import 'linker/template_ref.template.dart' as i8;
import 'linker/view_ref.template.dart' as i9;
import 'linker/view_container_ref.template.dart' as i10;
export 'linker.dart';
export 'linker/interfaces.dart' show AfterContentInit, AfterContentChecked, AfterViewInit, AfterViewChecked, OnChanges, OnDestroy, OnInit, DoCheck;
export 'linker/directive_resolver.dart' show DirectiveResolver;
export 'linker/view_resolver.dart' show ViewResolver;
export 'linker/compiler.dart' show Compiler;
export 'linker/view_manager.dart' show AppViewManager;
export 'linker/query_list.dart' show QueryList;
export 'linker/dynamic_component_loader.dart' show DynamicComponentLoader;
export 'linker/element_ref.dart' show ElementRef;
export 'linker/template_ref.dart' show TemplateRef;
export 'linker/view_ref.dart' show EmbeddedViewRef, HostViewRef, ViewRef, HostViewFactoryRef;
export 'linker/view_container_ref.dart' show ViewContainerRef;
export 'linker/dynamic_component_loader.dart' show ComponentRef;
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


