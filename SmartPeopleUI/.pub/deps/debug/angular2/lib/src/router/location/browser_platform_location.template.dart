library angular2.src.router.location.browser_platform_location.template.dart;

import 'browser_platform_location.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show Injectable;
import 'package:angular2/src/facade/browser.dart' show History, Location;
import 'platform_location.dart' show UrlChangeListener;
import 'platform_location.dart' show PlatformLocation;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/core.template.dart' as i0;
import 'platform_location.template.dart' as i1;
import 'package:angular2/src/platform/dom/dom_adapter.template.dart' as i2;
export 'browser_platform_location.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(BrowserPlatformLocation, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new BrowserPlatformLocation())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}


