import 'package:angular2/core.dart';

import 'header/login-componenet.dart';
import 'system-control-room/sign-up/sign-up-componenet.dart';
import 'footer/footer-componenet.dart';

@Component(
    selector: 'body',
    directives: const [LoginComponent, SignUpComponent, FooterComponent],
    styleUrls: const ['app.css'],
    templateUrl: 'app-view.html')
class AppComponent {}