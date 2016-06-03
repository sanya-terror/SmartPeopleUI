import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

@Component(
    selector: 'sp-header',
    directives: const [ROUTER_DIRECTIVES,],
    templateUrl: 'header.component.html',
    styleUrls: const ['header.component.css'])
class HeaderComponent {}
