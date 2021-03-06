import 'package:angular2/angular2.dart' show provide;
import 'package:angular2/router.dart' show ROUTER_PROVIDERS;
import 'package:angular2/platform/browser.dart' show bootstrap;
import 'package:angular2/platform/common.dart' show LocationStrategy, HashLocationStrategy;

import 'package:smartpeople_client/shared/services/index.dart' show LocalStorageService, SessionStorageService;
import 'package:smartpeople_client/shared/services/injectable-store.service.dart' show InjectableStore;
import 'package:smartpeople_client/app.component.dart' show AppComponent;
import 'package:smartpeople_client/shared/components/controls/dialog/dialog-manager.dart' show DialogManager;

main() => bootstrap(AppComponent, [
   ROUTER_PROVIDERS,
   provide(LocationStrategy, useClass: HashLocationStrategy),
   LocalStorageService,
   SessionStorageService,
   InjectableStore,
   DialogManager
]);