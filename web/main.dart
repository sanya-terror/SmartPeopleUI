import 'package:angular2/angular2.dart';
import 'package:angular2/bootstrap.dart';
import 'package:angular2/router.dart';

import 'package:SmartPeopleUI/index.dart';

main() => bootstrap(AppComponent, [
   ROUTER_PROVIDERS,
   provide(LocationStrategy, useClass: HashLocationStrategy)
]);