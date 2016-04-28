import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:angular2_material/src/components/button/button.dart';
import 'package:angular2_material/src/components/checkbox/checkbox.dart';

@Component(
    selector: 'header',
    directives: const [
       ROUTER_DIRECTIVES,
       MdButton,
       MdCheckbox
    ],
    encapsulation: ViewEncapsulation.None,
    templateUrl: 'header-view.html')

class HeaderComponent {

}

