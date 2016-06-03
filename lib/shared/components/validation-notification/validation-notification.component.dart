import 'package:angular2/core.dart';

@Component(
    selector: 'sp-validation-notification',
    templateUrl: 'validation-notification.component.html',
    styleUrls: const ['validation-notification.component.css'])
class ValidationNotificationComponent {
  @Input()
  String message;
}
