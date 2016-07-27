import 'package:angular2/angular2.dart' show Component, Input, ViewEncapsulation;

@Component(
    selector: 'sp-card',
    templateUrl: 'card.component.html',
    encapsulation: ViewEncapsulation.None,
    styleUrls: const ['card.component.css'])
class CardComponent {
  @Input()
  String title;
  @Input()
  bool hasExtraActions = true;
}
