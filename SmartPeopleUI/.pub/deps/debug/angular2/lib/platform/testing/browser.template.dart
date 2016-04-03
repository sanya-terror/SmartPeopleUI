library angular2.platform.testing.browser.template.dart;

import 'browser.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/platform/testing/browser_static.dart' show TEST_BROWSER_STATIC_PLATFORM_PROVIDERS, ADDITIONAL_TEST_BROWSER_PROVIDERS;
import 'package:angular2/platform/browser_static.dart' show BROWSER_APP_PROVIDERS;
import 'package:angular2/platform/testing/browser_static.template.dart' as i0;
import 'package:angular2/platform/browser_static.template.dart' as i1;
export 'browser.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}


