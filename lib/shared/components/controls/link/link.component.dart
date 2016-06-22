import 'package:angular2_rbi/directives.dart' show MaterialButton;
import 'package:angular2/angular2.dart' show Component, Input;

@Component(
   selector: 'sp-link',
   directives: const[ MaterialButton],
   templateUrl: 'link.component.html')
class LinkComponent {
   @Input() List routerLink;
   @Input() String label;
}
