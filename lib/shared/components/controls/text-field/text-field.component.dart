import 'package:angular2/angular2.dart' show Component, Control, FORM_PROVIDERS, Input;
import 'package:angular2_rbi/directives.dart' show MaterialTextfield;

@Component(
    selector: 'sp-input',
    directives: const [MaterialTextfield],
    providers: const [FORM_PROVIDERS],
    templateUrl: 'text-field.component.html',
    styleUrls: const ['text-field.component.css'])
class InputComponent {
  @Input()
  String type = 'text';
  @Input()
  String name;
  @Input()
  String placeholder;
  @Input()
  bool required = false;
  @Input()
  Control control;
}
