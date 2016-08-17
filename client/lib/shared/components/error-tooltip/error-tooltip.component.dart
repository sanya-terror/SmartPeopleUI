import 'package:angular2/core.dart';
import 'dart:html';

@Component(
    selector: 'sp-error-tooltip',
    templateUrl: 'error-tooltip.component.html',
    styleUrls: const ['error-tooltip.component.css'])
class ErrorTooltipComponent implements OnInit {
  @Input()
  String message;

  ElementRef _element;

  ErrorTooltipComponent(this._element);

  @override
  void ngOnInit() {
    Element e = _element.nativeElement;

    var notificationStyle = e.querySelector('.error-tooltip').style;

    e.parent.onMouseOver.listen((_) => notificationStyle.transform = 'scale(1)');
    e.parent.onMouseOut.listen((_) => notificationStyle.transform = 'scale(0)');
  }
}
