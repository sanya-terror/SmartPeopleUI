import 'package:angular2/core.dart';
import 'package:angular2_rbi/directives.dart';
import 'package:angular2/common.dart';

@Component(
selector: 'sp-input',
directives: const[ MaterialTextfield],
providers: const[FORM_PROVIDERS],
templateUrl: 'text-field.component.html',
styleUrls: const ['text-field.component.css'])
class InputComponent {
   @Input() String type = 'text';
   @Input() String name;
   @Input() String placeholder;
   @Input() Control control;


}
