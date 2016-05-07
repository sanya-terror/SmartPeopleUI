import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2_material/src/components/button/button.dart';

@Component(
    selector: 'restore-access',
    encapsulation: ViewEncapsulation.None,
    directives: const [
       ROUTER_DIRECTIVES,
       MdAnchor
    ],
    templateUrl: 'restore-access-view.html')
class RestoreAccessComponent {}