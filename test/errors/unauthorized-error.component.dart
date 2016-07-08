import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/mocks.dart' as mocks;

import 'package:SmartPeopleUI/index.dart';

class MockDialogComponent extends Mock implements DialogComponent {
   noSuchMethod(i) => super.noSuchMethod(i);
}

class UnauthorizedErrorTests {

   static run() {
      group('Unauthorized error component', () {

         var mockStore = mocks.getMockStore();
         var mockRouter = mocks.getRouter();
         var mockDialog = spy(new MockDialogComponent(), new DialogComponent());

         UnauthorizedErrorComponent component;
         setUp((){
            component = new UnauthorizedErrorComponent(mockStore, mockRouter);

            when(mockDialog.showModal()).thenReturn({});
            component.dialog = mockDialog;
         });

         test('Should clear unauthorized state and go to login page', () {
            component.goToSignIn();

            var isRemoveErrorAction = argThat(predicate((action) => action.type == ERROR_REMOVE_UNAUTHORIZED));
            verify(mockStore.dispatch(isRemoveErrorAction));

            verify(mockRouter.navigate(['Login']));
         });

         test('Should show popup', () {
            component.show();
            verify(mockDialog.showModal());
         });

         test('Should add dialog actions during initialization', () {

            component.ngOnInit();

            List<DialogAction> actions = component.dialogActions;
            expect(actions.length, 1);
            expect(actions[0].title, 'Sign in');
            expect(actions[0].execute, component.goToSignIn);
         });
      });
   }
}

void main() {
   UnauthorizedErrorTests.run();
}
