import 'package:angular2_rbi/directives.dart' show MaterialButton;
import 'package:angular2/router.dart' show ROUTER_DIRECTIVES;
import 'package:angular2/angular2.dart' show Component, Input;
import 'package:angular2/router.dart';

@Component(
   selector: 'sp-link',
   directives: const[MaterialButton, ROUTER_DIRECTIVES],
   templateUrl: 'link.component.html'
)

class LinkComponent {
   @Input() List routerLink;
   @Input() String label;
}
