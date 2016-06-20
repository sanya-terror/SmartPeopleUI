import 'package:angular2_rbi/directives.dart' show MaterialCheckbox;
import 'package:angular2/angular2.dart' show Component, Control, FORM_PROVIDERS, Input;

@Component(
   selector: 'sp-checkbox',
   directives: const[ MaterialCheckbox],
   providers: const[FORM_PROVIDERS],
   templateUrl: 'checkbox.component.html')
class CheckboxComponent {
   @Input() String name;
   @Input() String label;
   @Input() Control control;
}
