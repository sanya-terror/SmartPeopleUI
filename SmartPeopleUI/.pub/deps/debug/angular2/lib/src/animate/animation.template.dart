library angular2.src.animate.animation.template.dart;

import 'animation.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show DateWrapper, StringWrapper, RegExpWrapper, NumberWrapper, isPresent;
import 'package:angular2/src/facade/math.dart' show Math;
import 'package:angular2/src/platform/dom/util.dart' show camelCaseToDashCase;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'browser_details.dart' show BrowserDetails;
import 'css_animation_options.dart' show CssAnimationOptions;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/math.template.dart' as i1;
import 'package:angular2/src/platform/dom/util.template.dart' as i2;
import 'package:angular2/src/facade/collection.template.dart' as i3;
import 'package:angular2/src/platform/dom/dom_adapter.template.dart' as i4;
import 'browser_details.template.dart' as i5;
import 'css_animation_options.template.dart' as i6;
export 'animation.dart';
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


