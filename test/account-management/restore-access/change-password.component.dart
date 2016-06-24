import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:SmartPeopleUI/index.dart';
import '../../helpers/mocks.dart';
import 'package:angular2/common.dart';

class ChangePasswordComponentTests {
   static run() {
      group('Change password component', () {

         var mockStore;

         ChangePasswordComponent component;
         setUp((){
            mockStore = getMockStore();
            when(mockStore.dispatch(argThat(anything))).thenReturn({});
            component = new ChangePasswordComponent(mockStore);
         });

         test('Should add passwordControl to form group', () {
            expect(component.form.controls['password'], component.passwordControl);
         });

         test('Should apply changing password', () {

            String password = 'qwerty123';

            String token = 'change_password_token';
            when(mockStore.state).thenReturn(new State({'restoreAccess': new RestoreAccessData()..changePasswordToken = token}));

            component.passwordControl = new Control(password);
            component.applyPasswordChanging();

            var isValidAction = predicate((action) => action.type == APPLY_PASSWORD_CHANGING && action.data['password'] == password && action.data['token'] == token);
            expect(verify(mockStore.dispatch(argThat(isValidAction))).callCount, 1);
         });
      });
   }
}

void main() {
   ChangePasswordComponentTests.run();
}
