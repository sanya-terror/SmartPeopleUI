import 'package:angular2_rbi/directives.dart' show MaterialButton;
import 'package:angular2/angular2.dart' show Component, Control, FORM_PROVIDERS, Input;

@Component(
   selector: 'sp-link',
   directives: const[ MaterialButton],
   providers: const[FORM_PROVIDERS],
   templateUrl: 'link.component.html')
class LinkComponent {
   @Input() List routerLink;
   @Input() String label;
}
