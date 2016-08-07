import 'package:angular2/core.dart' show Component, OnDestroy;
import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart' show InjectableStore;
import 'package:SmartPeopleUI/index.dart' show ApiActionCreator;

@Component(
    selector: 'sp-not-found-error',
    templateUrl: 'not-found-error.component.html',
    styleUrls: const ['not-found-error.component.css'])
class NotFoundErrorComponent implements OnDestroy {
  final InjectableStore _store;

  NotFoundErrorComponent(this._store);

  @override
  void ngOnDestroy() {
    _store.dispatch(ApiActionCreator.notFoundCleanAction());
  }
}
