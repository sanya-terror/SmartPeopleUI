import 'package:angular2/core.dart';
import 'dart:html';

@Component(
    selector: 'sp-validation-notification',
    templateUrl: 'validation-notification.component.html',
    styleUrls: const ['validation-notification.component.css'])
class ValidationNotificationComponent implements OnInit {
  @Input() String forId;
  @Input() String message;

  ElementRef _element;

  ValidationNotificationComponent(this._element);

  @override
  ngOnInit() {
    Element e = _element.nativeElement;

    var notificationStyle = e.querySelector('.validation-notification').style;

    e.parent.onMouseOver.listen((_) =>  notificationStyle.transform = 'scale(1)');
    e.parent.onMouseOut.listen((_) =>  notificationStyle.transform = 'scale(0)');
  }
}
