import 'package:angular2/core.dart';

import 'package:SmartPeopleUI/header/login-component.dart';
import 'package:SmartPeopleUI/footer/footer-component.dart';

@Component(
    selector: 'my-app',
    directives: const [LoginComponent, FooterComponent],
    styleUrls: const ['app.css'],
    encapsulation: ViewEncapsulation.None,
    templateUrl: 'app-view.html')
class AppComponent {}