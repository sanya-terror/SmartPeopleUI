import 'package:angular2/core.dart' show Component, OnInit, ViewChild;
import 'package:angular2/router.dart' show Router;

import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart' show InjectableStore;
import 'package:SmartPeopleUI/index.dart' show AuthActionCreator, DialogAction;
import 'package:SmartPeopleUI/shared/components/controls/dialog/dialog.component.dart';

@Component(
    selector: 'sp-logout',
    templateUrl: 'logout.component.html',
    directives: const[DialogComponent]
)

class ConfirmationToLogout implements OnInit{

   @ViewChild(DialogComponent)
   DialogComponent dialog;

   final InjectableStore _store;
   final Router _router;


   List<DialogAction> dialogActions = [];

   ConfirmationToLogout(this._store, this._router);

   @override
   ngOnInit() {
      dialogActions.add(new DialogAction('Yes', _onYesClick));
      dialogActions.add(new DialogAction('No', _onNoClick));
   }

   onLogout(){
      dialog.showModal();
   }

   _onYesClick() {
      _store.dispatch(AuthActionCreator.logoutSuccess());
      _router.navigate(['Login']);
      dialog.close();
   }

   _onNoClick() {
      dialog.close();
   }

}

