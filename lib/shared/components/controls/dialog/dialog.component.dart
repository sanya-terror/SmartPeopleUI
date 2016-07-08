import 'package:angular2/angular2.dart' show Component, ContentChild, ElementRef, Input, ViewChild, ViewEncapsulation;
import 'package:angular2/router.dart' show Router;
import 'package:angular2_rbi/directives.dart' show MaterialButton;
import 'dart:html';

import 'package:SmartPeopleUI/shared/components/controls/dialog/rbi-dialog.dart';

@Component(
   selector: 'sp-dialog',
   templateUrl: 'dialog.component.html',
   directives: const[DialogWrapper],
    encapsulation: ViewEncapsulation.None,
   styleUrls: const ['dialog.component.css', 'rbi-dialog.css'])
class DialogComponent {
   @Input() String title;
   @Input() List<DialogAction> actions;

   @ViewChild(DialogWrapper) DialogWrapper dialog;

   showModal(){
      dialog.showModal();
   }
}

class DialogAction{
   String title;
   Function execute;

   DialogAction(this.title, this.execute);
}