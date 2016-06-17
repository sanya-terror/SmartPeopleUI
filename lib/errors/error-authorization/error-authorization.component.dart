import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:angular2/router.dart';

import 'package:SmartPeopleUI/shared/index.dart';

@Component(
    selector: 'change-password',
    directives: const [
      ROUTER_DIRECTIVES,
      ValidationNotificationComponent,
      InfoComponent
    ],
    encapsulation: ViewEncapsulation.Emulated,
    templateUrl: 'error-authorization.component.html',
    styleUrls: const ['error-authorization.component.css'])
class ErrorAuthorizationComponent extends FormComponent {
  ControlGroup form;

  ErrorAuthorizationComponent() {
    this.form = new ControlGroup({
      'email': new Control('',
          Validators.compose([EmailValidator.validate, Validators.required])),
      'password': new Control(
          '',
          Validators.compose([
            PasswordValidator.validate,
            Validators.required,
            Validators.minLength(6),
            Validators.maxLength(18)
          ]))
    });
  }
}
