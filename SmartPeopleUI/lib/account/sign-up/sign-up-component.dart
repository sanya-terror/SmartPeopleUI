import 'dart:html';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

@Component(
    selector: 'sign-up',
    directives: const [
       ROUTER_DIRECTIVES
    ],
    encapsulation: ViewEncapsulation.None,
    templateUrl: 'sign-up-view.html')

class SignUpComponent {}

void main() {
   querySelector(".content-logo").style.backgroundImage = "url(../images/logo.png)";
}
