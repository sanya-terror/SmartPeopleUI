import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

@Component(
    selector: 'header',
    directives: const [ROUTER_DIRECTIVES],
    encapsulation: ViewEncapsulation.None,
    templateUrl: 'header-view.html')

class HeaderComponent {}