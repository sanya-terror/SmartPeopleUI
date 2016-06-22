import 'package:angular2_rbi/directives.dart' show MaterialRadio;
import 'package:angular2/angular2.dart' show Component, Control, FORM_PROVIDERS, Input;

@Component(
   selector: 'sp-radio',
   directives: const[ MaterialRadio],
   providers: const[FORM_PROVIDERS],
   templateUrl: 'radio-button.component.html')
class RadioButtonComponent {
   @Input() String id;
   @Input() String name;
   @Input() String value;
   @Input() String label;
   @Input() Control control;
}
