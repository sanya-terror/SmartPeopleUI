library angular2.src.common.pipes.common_pipes.template.dart;

import 'common_pipes.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'async_pipe.dart' show AsyncPipe;
import 'uppercase_pipe.dart' show UpperCasePipe;
import 'lowercase_pipe.dart' show LowerCasePipe;
import 'json_pipe.dart' show JsonPipe;
import 'slice_pipe.dart' show SlicePipe;
import 'date_pipe.dart' show DatePipe;
import 'number_pipe.dart' show DecimalPipe, PercentPipe, CurrencyPipe;
import 'replace_pipe.dart' show ReplacePipe;
import 'i18n_plural_pipe.dart' show I18nPluralPipe;
import 'i18n_select_pipe.dart' show I18nSelectPipe;
import 'async_pipe.template.dart' as i0;
import 'uppercase_pipe.template.dart' as i1;
import 'lowercase_pipe.template.dart' as i2;
import 'json_pipe.template.dart' as i3;
import 'slice_pipe.template.dart' as i4;
import 'date_pipe.template.dart' as i5;
import 'number_pipe.template.dart' as i6;
import 'replace_pipe.template.dart' as i7;
import 'i18n_plural_pipe.template.dart' as i8;
import 'i18n_select_pipe.template.dart' as i9;
export 'common_pipes.dart';
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
}


