library angular2.src.platform.browser.tools.common_tools.template.dart;

import 'common_tools.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/application_ref.dart' show ApplicationRef;
import 'package:angular2/src/core/linker/dynamic_component_loader.dart' show ComponentRef, ComponentRef_;
import 'package:angular2/src/facade/lang.dart' show isPresent, NumberWrapper;
import 'package:angular2/src/facade/browser.dart' show window;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/core/application_ref.template.dart' as i0;
import 'package:angular2/src/core/linker/dynamic_component_loader.template.dart' as i1;
import 'package:angular2/src/facade/lang.template.dart' as i2;
import 'package:angular2/src/platform/dom/dom_adapter.template.dart' as i3;
export 'common_tools.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}


