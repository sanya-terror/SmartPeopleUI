import 'package:angular2/angular2.dart' show Component, ElementRef, Input, ViewEncapsulation;
import 'package:angular2/router.dart' show Router;
import 'package:angular2_rbi/directives.dart' show MaterialButton;
import 'dart:html';

@Component(
   selector: 'sp-dialog',
   templateUrl: 'dialog.component.html',
   styleUrls: const ['dialog.component.css'])
class DialogComponent {
   @Input() String title;

   ElementRef elementRef;

   DialogComponent(this.elementRef);

   showModal(){
      print('show me, ${elementRef.nativeElement}');
      Element e = elementRef.nativeElement;
      (e.querySelector('rbi-dialog') as DialogElement).showModal();
   }
}
