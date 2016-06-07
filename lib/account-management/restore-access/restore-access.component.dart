import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:angular2/router.dart';

import 'package:angular2_material/src/components/button/button.dart';
import 'validators/restore-code.validator.dart';

import 'package:SmartPeopleUI/shared/index.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/account-management/restore-access/index.dart';

@Component(
    selector: 'restore-access',
    directives: const [
      ROUTER_DIRECTIVES,
      ValidationNotificationComponent,
      MdButton,
      InfoComponent
    ],
    encapsulation: ViewEncapsulation
        .Native, //TODO it is temporary, in further should remove and avoid
    templateUrl: 'restore-access.component.html',
    styleUrls: const ['restore-access.component.css'])
class RestoreAccessComponent extends FormComponent implements OnInit {

  bool codeSent = false;
  bool userNotFound = false;
  bool invalidCode = false;

  final InjectableStore _store;
  final Router _router;

  ControlGroup form;

  RestoreAccessComponent(this._store, this._router) {
    this.form = new ControlGroup({
      'email': new Control('test@test.com',
          Validators.compose([EmailValidator.validate, Validators.required])),
      'code': new Control(
          '',
          Validators
              .compose([RestoreCodeValidator.validate, Validators.required]))
    });
  }

  ngOnInit() {
    _store.listen(_onStateChange);
  }

  _onStateChange(State state){

    print(state);

    var restoreAccess = state['restoreAccess'];
    if (restoreAccess == null) return;

    codeSent = restoreAccess['codeSent'];
    userNotFound = restoreAccess['userNotFound'];
    invalidCode = restoreAccess['invalidCode'];

    bool codeApplied = restoreAccess['codeApplied'];

    if (codeApplied != null && codeApplied){
      setDefault();
      _router.navigate(['ChangePassword']);
    }
  }

  getCode(){
    var email = form.controls['email'].value;
    _store.dispatch(RestoreAccessActionCreator.getRestoreCode(email));
  }

  applyCode(){
    var code = form.controls['code'].value;
    _store.dispatch(RestoreAccessActionCreator.applyRestoreCode(code));
  }

  setDefault() => _store.dispatch(RestoreAccessActionCreator.clearRestoreAccess());
}
