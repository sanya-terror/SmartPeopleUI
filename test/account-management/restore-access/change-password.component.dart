import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:SmartPeopleUI/index.dart';
import '../../helpers/mocks.dart';
import '../../helpers/matchers.dart';

class ChangePasswordComponentTests {
   static run() {
      group('Change password component', () {

         var mockStore;
         var password = 'qwerty12';

         ChangePasswordComponent component;
         setUp((){
            mockStore = getMockStore();
            component = new ChangePasswordComponent(mockStore);
            component.passwordControl.updateValue(password);
            component.passwordRepeatControl.updateValue(password);
         });

         test('Should add all controls to form group', () {
            expect(component.form.controls['password'], component.passwordControl);
            expect(component.form.controls['passwordRepeat'], component.passwordRepeatControl);
         });

         group('On state change',() {

            var onStateChange;

            setUp((){
               var subscriptionStream = _mockSubscription(mockStore);
               component.applyPasswordChanging();
               onStateChange = verify(subscriptionStream.listen(captureAny)).captured[0];
            });

            test('Should not dispatch any action if receive error on changing password', () async {

               var data = new RestoreAccessData()..errorCode = 3333;
               await onStateChange(data);

               expect(component.isPasswordChangingError, true);
               expect(verify(mockStore.dispatch(anything)).callCount, 1); // one action dispatch is called during component.applyPasswordChanging()
            });

            test('Should clear restore info and login if changing password is successful', () async {

               var email = 'some@email.com';
               var data = new RestoreAccessData()..errorCode = null;

               when(mockStore.state).thenReturn(new State({'email': email}));

               await onStateChange(data);

               expect(component.isPasswordChangingError, false);

               var isClearRestoreAccessDataAction = predicate((action) => action.type == RESTORE_ACCESS_CLEAR_DATA);
               expect(verify(mockStore.dispatch(argThat(isClearRestoreAccessDataAction))).callCount, 1);

               var isLoginRequestAction = predicate((action) =>
                  action.type == LOGIN_REQUEST
                  && action.data['user'] == email
                  && action.data['password'] == component.passwordControl.value);
               expect(verify(mockStore.dispatch(argThat(isLoginRequestAction))).callCount, 1,
               reason: 'No matching login request call found!');
            });
         });

         test('Should apply changing password', () {
            String token = 'change_password_token';
            when(mockStore.state).thenReturn(new State({'restoreAccess': new RestoreAccessData()..changePasswordToken = token}));

            component.applyPasswordChanging();

            var isValidAction = predicate((action) =>
               action.type == RESTORE_ACCESS_CHANGE_PASSWORD
               && action.data['password'] == password
               && action.data['token'] == token);
            expect(verify(mockStore.dispatch(argThat(isValidAction))).callCount, 1);
         });

         test('Should not apply changing password and subscribe when form is invalid', () {

            component.form.setErrors({'some_error': 'error'});

            var subscriptionStream = _mockSubscription(mockStore);

            component.applyPasswordChanging();

            verifyNever(subscriptionStream.listen(argThat(anything)));
            verifyNever(mockStore.dispatch(anything));
         });
      });
   }

   static _mockSubscription(mockStore) {

      var mappedStream = getStream();
      var filteredStream = getStream();
      var takenStream = getStream();

      var restoreAccessMapPredicate = predicate((f) {
         var data = new RestoreAccessData();
         var state = new State({'restoreAccess': data});
         return f(state) == data;
      });

      when(mockStore.map(restoreAccessMapPredicate)).thenReturn(mappedStream);
      when(mappedStream.where(notNullPredicate)).thenReturn(filteredStream);
      when(filteredStream.take(1)).thenReturn(takenStream);
      return takenStream;
   }
}

void main() {
   ChangePasswordComponentTests.run();
}
