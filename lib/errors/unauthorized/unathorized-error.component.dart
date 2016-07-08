import 'package:angular2/core.dart';
import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart';
import 'package:SmartPeopleUI/index.dart';
import 'package:SmartPeopleUI/shared/components/controls/dialog/dialog.component.dart';

@Component(
selector: 'sp-unauthorized-error',
templateUrl: 'unathorized-error.component.html',
directives: const[DialogComponent],
styleUrls: const['unathorized-error.component.css'])
class UnauthorizedErrorComponent implements OnDestroy{

  final InjectableStore _store;

  UnauthorizedErrorComponent(this._store);

  List<DialogAction> dialogActions = [
    new DialogAction('Close', _hello)
  ];

  static _hello(){
    print('hello');
  }

  @override
  ngOnDestroy() {
    _store.dispatch(ApiActionCreator.unauthorizedCleanAction());
  }
}
