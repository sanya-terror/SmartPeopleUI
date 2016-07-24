@MirrorsUsed() import 'package:angular2/angular2.dart' show provide;
@MirrorsUsed() import 'package:angular2/router.dart' show ROUTER_PROVIDERS;
@MirrorsUsed() import 'package:angular2/platform/browser.dart' show bootstrap;
@MirrorsUsed() import 'package:angular2/platform/common.dart' show LocationStrategy, HashLocationStrategy;

@MirrorsUsed() import 'package:SmartPeopleUI/shared/services/index.dart' show LocalStorageService, SessionStorageService;
@MirrorsUsed() import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart' show InjectableStore;
@MirrorsUsed() import 'package:SmartPeopleUI/app.component.dart' show AppComponent;
@MirrorsUsed() import 'package:SmartPeopleUI/shared/components/controls/dialog/dialog-manager.dart' show DialogManager;

main() => bootstrap(AppComponent, [
   ROUTER_PROVIDERS,
   provide(LocationStrategy, useClass: HashLocationStrategy),
   LocalStorageService,
   SessionStorageService,
   InjectableStore,
   DialogManager
]);