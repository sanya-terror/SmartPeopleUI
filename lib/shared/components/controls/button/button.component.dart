import 'package:angular2/angular2.dart' show Component, Input, Output, EventEmitter;
import 'package:angular2/router.dart' show Router;
import 'package:angular2_rbi/directives.dart' show MaterialButton;

@Component(
   selector: 'sp-button',
   templateUrl: 'button.component.html',
   directives: const [ MaterialButton],
   styleUrls: const ['button.component.css'])
class ButtonComponent {
   @Input() String label;
   @Input() List<String> route;
   @Input() bool accent = false;
   @Output('click') EventEmitter handler = new EventEmitter();

   Router _router;

   ButtonComponent(this._router);

   onClick() {
      handler.emit(true);

      if (route == null) return;

      _router.navigate(route);
   }
}
