import 'dart:html';
import 'package:angular2/core.dart';

@Component(
    selector: 'sign-up',
    encapsulation: ViewEncapsulation.None,
    templateUrl: 'sign-up-view.html')

class SignUpComponent {}

void main() {
   querySelector(".content-logo").style.backgroundImage = "url(../images/logo.png)";
}
