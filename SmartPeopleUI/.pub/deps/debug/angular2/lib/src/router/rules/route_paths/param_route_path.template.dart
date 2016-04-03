library angular2.src.router.rules.route_paths.param_route_path.template.dart;

import 'param_route_path.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show RegExpWrapper, StringWrapper, isPresent, isBlank;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper;
import '../../utils.dart' show TouchMap, normalizeString;
import '../../url_parser.dart' show Url, RootUrl, convertUrlParamsToArray;
import 'route_path.dart' show RoutePath, GeneratedUrl, MatchedUrl;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/exceptions.template.dart' as i1;
import 'package:angular2/src/facade/collection.template.dart' as i2;
import '../../utils.template.dart' as i3;
import '../../url_parser.template.dart' as i4;
import 'route_path.template.dart' as i5;
export 'param_route_path.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}


