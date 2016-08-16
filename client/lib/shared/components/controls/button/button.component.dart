import 'package:angular2/angular2.dart' show Component, Input;
import 'package:angular2/router.dart' show Router;
import 'package:angular2_rbi/directives.dart' show MaterialButton;

@Component(
    selector: 'sp-button',
    templateUrl: 'button.component.html',
    directives: const [MaterialButton],
    styleUrls: const ['button.component.css'])
class ButtonComponent {
  @Input()
  String label;
  @Input()
  List<String> route;
  @Input()
  bool accent = false;
  @Input()
  bool fill = false;
  @Input()
  bool raised = true;

  Router _router;

  ButtonComponent(this._router);

  void onClick() {
    if (route == null) return;
    _router.navigate(route);
  }
}
