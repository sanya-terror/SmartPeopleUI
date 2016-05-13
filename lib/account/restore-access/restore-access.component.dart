import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2_material/src/components/button/button.dart';

import 'package:SmartPeopleUI/shared/directives/index.dart';
import 'directives/index.dart';

import 'package:SmartPeopleUI/shared/index.dart';

@Component(
  selector: 'restore-access',
  directives: const [
    ROUTER_DIRECTIVES,
    EmailValidatorDirective,
    RestoreCodeValidatorDirective,
    MdAnchor,
    InfoComponent
  ],
  templateUrl: 'restore-access.component.html',
  styleUrls: const['restore-access.component.css'])
class RestoreAccessComponent {
   String email;
   String code;
}