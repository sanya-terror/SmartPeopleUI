import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

@Component(
  selector: 'sp-validation-notification',
  directives: const [ROUTER_DIRECTIVES],
  templateUrl: 'validation-notification.component.html',
  styleUrls: const ['validation-notification.component.css'])



class ValidationNotificationComponent {
   @Input() String message;
}

