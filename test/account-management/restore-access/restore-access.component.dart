import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:SmartPeopleUI/index.dart';
import '../../helpers.dart';
import 'package:angular2/common.dart';

class RestoreAccessComponentTests {
  static run() {
    group('Restore access component', () {

      var mockStore;
      var router;

      RestoreAccessComponent component;
      setUp((){
        mockStore = getMockStore();
        router = getRouter();
        when(mockStore.dispatch(argThat(anything))).thenReturn({});
        component = new RestoreAccessComponent(mockStore, router);
      });

      test('Should subscribe on change during initialization', () {
        component.ngOnInit();
        expect(verify(mockStore.listen(argThat(anything))).callCount, 1);
      });

      group('On state change', (){

        var onStateChange;

        setUp((){
          component.ngOnInit();
          onStateChange = verify(mockStore.listen(captureAny)).captured[0];
        });

        test('Should not change component state if no restoreAccess object in new state', () {

          var newState = new State({'restoreAccess': null});
          onStateChange(newState);

          expect(component.isCodeSent, null);
          expect(component.isInvalidCode, null);
          expect(component.isUserNotFound, null);
        });

        test('Should change component state base on restoreAccess object in new state', () {

          var newState = new State({'restoreAccess': {'codeSent': true}});
          onStateChange(newState);

          expect(component.isCodeSent, true);
          expect(component.isInvalidCode, null);
          expect(component.isUserNotFound, null);

          newState = new State({'restoreAccess': {'invalidCode': true}});
          onStateChange(newState);

          expect(component.isCodeSent, null);
          expect(component.isInvalidCode, true);
          expect(component.isUserNotFound, null);

          newState = new State({'restoreAccess': {'userNotFound': true}});
          onStateChange(newState);

          expect(component.isCodeSent, null);
          expect(component.isInvalidCode, null);
          expect(component.isUserNotFound, true);

        });

        test('Should set default and navigate to change password if code applied', () {

          when(router.navigate(argThat(contains('ChangePassword')))).thenReturn({});

          var newState = new State({'restoreAccess': {'codeApplied': true}});
          onStateChange(newState);

          expect(verify(router.navigate(argThat(contains('ChangePassword')))).callCount, 1);
          expect(verify(mockStore.dispatch(argThat(predicate((action) => action.type == CLEAR_RESTORE_ACCESS)))).callCount, 1);
        });
      });

      test('Should get code', () {

        var email = 'test@mail.com';
        component.form.controls['email'] = new Control(email);
        component.getCode();

        var isValidAction = predicate((action) => action.type == GET_RESTORE_CODE && action.data['email'] == email);
        expect(verify(mockStore.dispatch(argThat(isValidAction))).callCount, 1);
      });

      test('Should apply code', () {

        var code = 'QWERTY123';
        component.form.controls['code'] = new Control(code);
        component.applyCode();

        var isValidAction = predicate((action) => action.type == APPLY_RESTORE_CODE && action.data['code'] == code);
        expect(verify(mockStore.dispatch(argThat(isValidAction))).callCount, 1);
      });

      test('Should set default', () {
        component.setDefault();
        expect(verify(mockStore.dispatch(argThat(predicate((action) => action.type == CLEAR_RESTORE_ACCESS)))).callCount, 1);
      });
    });
  }
}

void main() {
  RestoreAccessComponentTests.run();
}
