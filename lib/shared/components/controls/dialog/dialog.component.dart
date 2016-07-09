import 'package:angular2/angular2.dart' show Component, Input, ViewChild, ViewEncapsulation;

import 'package:SmartPeopleUI/shared/components/controls/dialog/rbi-dialog.dart' show DialogWrapper;

@Component(
   selector: 'sp-dialog',
   templateUrl: 'dialog.component.html',
   directives: const[DialogWrapper],
    encapsulation: ViewEncapsulation.None,
   styleUrls: const ['rbi-dialog.css', 'dialog.component.css'])
class DialogComponent {

   @Input() String title;
   @Input() List<DialogAction> actions;

   @ViewChild(DialogWrapper) DialogWrapper dialog;

   showModal(){
      dialog.showModal();
   }

   show(){
      dialog.show();
   }

   close(){
      dialog.close();
   }
}

class DialogAction{
   String title;
   Function execute;

   DialogAction(this.title, this.execute);
}