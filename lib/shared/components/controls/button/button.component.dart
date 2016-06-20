import 'package:angular2_rbi/directives.dart' show MaterialButton;
import 'package:angular2/angular2.dart' show Component, Input, Output, EventEmitter;

@Component(
   selector: 'sp-button',
   directives: const[ MaterialButton],
   templateUrl: 'button.component.html',
   styleUrls: const ['button.component.css'])
class ButtonComponent {
   @Input() String label;
   @Output('click') EventEmitter onClick = new EventEmitter();
}
