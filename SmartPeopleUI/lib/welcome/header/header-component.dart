import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'dart:html';

@Component(
    selector: 'header',
    directives: const [ROUTER_DIRECTIVES],
    encapsulation: ViewEncapsulation.None,
    templateUrl: 'header-view.html')

class HeaderComponent {

}

void main() {
   querySelector(".logo").style.backgroundImage = "url(../images/top-logo.png)";
}
