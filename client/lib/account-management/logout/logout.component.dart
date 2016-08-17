import 'package:angular2/core.dart' show Component, OnInit, ViewChild;
import 'package:angular2/router.dart' show Router;

import 'package:smartpeople_client/shared/services/injectable-store.service.dart' show InjectableStore;
import 'package:smartpeople_client/index.dart' show AuthActionCreator, DialogAction;
import 'package:smartpeople_client/shared/components/controls/dialog/dialog.component.dart';

@Component(
    selector: 'sp-logout',
    templateUrl: 'logout.component.html',
    directives: const[DialogComponent]
)

class LogoutComponent implements OnInit{

   @ViewChild(DialogComponent)
   DialogComponent dialog;

   final InjectableStore _store;
   final Router _router;

   List<DialogAction> dialogActions = [];

   LogoutComponent(this._store, this._router);

   @override
   ngOnInit() {
      dialogActions.add(new DialogAction('Yes', _onYesClick));
      dialogActions.add(new DialogAction('No', _onNoClick));
   }

   logout(){
      dialog.showModal();
   }

   _onYesClick() {
      _store.dispatch(AuthActionCreator.requestLogout());
      _router.navigate(['Login']);
      dialog.close();
   }

   _onNoClick() {
      dialog.close();
   }

}

