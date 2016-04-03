library angular2.src.router.location.path_location_strategy.template.dart;

import 'path_location_strategy.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show Injectable, Inject, Optional;
import 'package:angular2/src/facade/lang.dart' show isBlank;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'location_strategy.dart' show LocationStrategy, APP_BASE_HREF, normalizeQueryParams, joinWithSlash;
import 'platform_location.dart' show PlatformLocation, UrlChangeListener;
import 'package:angular2/core.template.dart' as i0;
import 'package:angular2/src/facade/lang.template.dart' as i1;
import 'package:angular2/src/facade/exceptions.template.dart' as i2;
import 'location_strategy.template.dart' as i3;
import 'platform_location.template.dart' as i4;
export 'path_location_strategy.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(PathLocationStrategy, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [PlatformLocation], const [String, const Optional(), const Inject(APP_BASE_HREF)]],
(PlatformLocation _platformLocation, String href) => new PathLocationStrategy(_platformLocation, href))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}


