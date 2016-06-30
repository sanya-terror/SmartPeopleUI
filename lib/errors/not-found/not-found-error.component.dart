import 'package:angular2/core.dart';
import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart';
import 'package:SmartPeopleUI/index.dart';

@Component(
selector: 'sp-not-found-error',
templateUrl: 'not-found-error.component.html',
styleUrls: const['not-found-error.component.css'])
class NotFoundErrorComponent implements OnDestroy{

  final InjectableStore _store;

  NotFoundErrorComponent(this._store);

  @override
  ngOnDestroy() {
    _store.dispatch(ApiActionCreator.notFoundCleanAction());
  }
}
