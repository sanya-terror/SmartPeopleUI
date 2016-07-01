import 'package:angular2/angular2.dart' show Component, Input;

@Component(
   selector: 'sp-card',
   templateUrl: 'card.component.html',
   styleUrls: const ['card.component.css']
)

class CardComponent {
   @Input() bool hasExtraActions = true;
}
