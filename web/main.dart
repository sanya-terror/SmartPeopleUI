import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/browser.dart';
import 'package:angular2/platform/common.dart';

import 'package:SmartPeopleUI/shared/services/local-storage.service.dart';
import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart';
import 'package:SmartPeopleUI/app.component.dart';

main() => bootstrap(AppComponent, [
   ROUTER_PROVIDERS,
   provide(LocationStrategy, useClass: HashLocationStrategy),
   LocalStorageService,
   InjectableStore
]);