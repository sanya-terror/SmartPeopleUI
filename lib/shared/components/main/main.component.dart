import 'package:angular2/core.dart' show Component;
import 'package:angular2/router.dart' show ROUTER_DIRECTIVES;
import 'package:SmartPeopleUI/index.dart' show FooterComponent;

@Component(
    selector: 'sp-main',
    directives: const [ROUTER_DIRECTIVES, FooterComponent],
    templateUrl: 'main.component.html',
    styleUrls: const ['main.component.css'])
class MainComponent {}
