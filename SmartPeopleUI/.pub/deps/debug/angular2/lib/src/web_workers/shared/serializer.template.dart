library angular2.src.web_workers.shared.serializer.template.dart;

import 'serializer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type, isArray, isPresent, serializeEnum, deserializeEnum;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/facade/collection.dart' show Map, StringMapWrapper, MapWrapper;
import 'package:angular2/src/core/render/api.dart' show RenderComponentType;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/web_workers/shared/render_store.dart' show RenderStore;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation, VIEW_ENCAPSULATION_VALUES;
import 'serialized_types.dart' show LocationType;
import 'package:angular2/src/facade/lang.template.dart' as i0;
import 'package:angular2/src/facade/exceptions.template.dart' as i1;
import 'package:angular2/src/facade/collection.template.dart' as i2;
import 'package:angular2/src/core/render/api.template.dart' as i3;
import 'package:angular2/src/core/di.template.dart' as i4;
import 'package:angular2/src/web_workers/shared/render_store.template.dart' as i5;
import 'package:angular2/src/core/metadata/view.template.dart' as i6;
import 'serialized_types.template.dart' as i7;
export 'serializer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Serializer, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [RenderStore]],
(RenderStore _renderStore) => new Serializer(_renderStore))
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
}


