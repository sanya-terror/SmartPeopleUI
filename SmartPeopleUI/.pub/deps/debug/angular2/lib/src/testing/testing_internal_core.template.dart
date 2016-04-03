library angular2.src.testing.testing_internal_core.template.dart;

import 'testing_internal_core.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:guinness2/guinness2.dart' as gns;
import 'package:angular2/src/core/reflection/reflection.dart';
import 'package:angular2/src/core/di/provider.dart' show bind;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper;
import 'test_injector.dart';
import 'package:angular2/src/core/reflection/reflection.template.dart' as i0;
import 'package:angular2/src/core/di/provider.template.dart' as i1;
import 'package:angular2/src/facade/collection.template.dart' as i2;
import 'test_injector.template.dart' as i3;
import 'matchers.template.dart' as i4;
export 'testing_internal_core.dart';
export 'package:guinness2/guinness2.dart' hide Expect, expect, NotExpect, beforeEach, it, iit, xit, describe, ddescribe, xdescribe, SpyObject, SpyFunction;
export 'matchers.dart' show expect, Expect, NotExpect;
export 'test_injector.dart' show inject;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


