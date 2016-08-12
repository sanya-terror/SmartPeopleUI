import 'package:angular2/core.dart' show Component, OnInit, ViewChild;
import 'package:angular2/router.dart' show Router;

import 'package:SmartPeopleUI/shared/services/injectable-store.service.dart' show InjectableStore;
import 'package:SmartPeopleUI/index.dart' show AuthActionCreator, DialogAction;
import 'package:SmartPeopleUI/shared/components/controls/dialog/dialog.component.dart';

@Component(
    selector: 'sp-log-out',
    templateUrl: 'log-out.component.html',
    directives: const[DialogComponent]
)

class ConfirmationToLogOut implements OnInit{

   @ViewChild(DialogComponent)
   DialogComponent dialog;

   final InjectableStore _store;
   final Router _router;


   List<DialogAction> dialogActions = [];

   ConfirmationToLogOut(this._store, this._router);

   @override
   ngOnInit() {
      dialogActions.add(new DialogAction('Yes', _onYesClick));
      dialogActions.add(new DialogAction('No', _onNoClick));
   }

   onLogOut(){
      dialog.showModal();
   }

   _onYesClick() {
      _store.dispatch(AuthActionCreator.logOut());
      _router.navigate(['Login']);
      dialog.close();
   }

   _onNoClick() {
      dialog.close();
   }

}

