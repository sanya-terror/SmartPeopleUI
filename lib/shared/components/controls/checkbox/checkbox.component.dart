import 'package:angular2/core.dart';
import 'package:angular2_rbi/directives.dart';
import 'package:angular2/common.dart';

@Component(
   selector: 'sp-checkbox',
   directives: const[ MaterialCheckbox],
   providers: const[FORM_PROVIDERS],
   templateUrl: 'checkbox.component.html',
   styleUrls: const ['checkbox.component.css'])
class CheckboxComponent {
   @Input() String name;
   @Input() String label;
   @Input() Control control;
}
