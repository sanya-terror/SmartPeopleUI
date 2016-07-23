import 'dart:mirrors';

import 'package:test/test.dart';
@MirrorsUsed()
import 'package:mockito/mockito.dart';

import '../helpers/mocks.dart' as mocks;

import 'package:SmartPeopleUI/index.dart';
import '../helpers/mocks.dart';

class MockDialogComponent extends Mock implements DialogComponent {
   noSuchMethod(i) => super.noSuchMethod(i);
}

class UnauthorizedErrorTests {

   static run() {
      group('Unauthorized error component', () {

         var mockStore = mocks.getMockStore();
         var mockRouter = mocks.getRouter();
         DialogComponent mockDialog;

         UnauthorizedErrorComponent component;
         setUp((){
            component = new UnauthorizedErrorComponent(mockStore, mockRouter);

            mockDialog = spy(new MockDialogComponent(), new DialogComponent());
            when(mockDialog.showModal()).thenReturn({});
            when(mockDialog.close()).thenReturn({});
            component.dialog = mockDialog;
         });

         group('On init',() {
            test('Should add dialog actions', () {
               component.ngOnInit();

               List<DialogAction> actions = component.dialogActions;
               expect(actions.length, 1);
               expect(actions[0].title, 'Sign in');
            });

            test('Should subscribe on changes', (){
               var subscriptionStream = _mockSubscription(mockStore);
               component.ngOnInit();
               expect(verify(subscriptionStream.listen(captureAny)).callCount, 1);
            });
         });

         group('On state change', () {
            var onStateChange;

            setUp(() {
               var subscriptionStream = _mockSubscription(mockStore);
               component.ngOnInit();
               onStateChange = verify(subscriptionStream.listen(captureAny)).captured[0];
            });

            test('Should open dialog if error', () {
               onStateChange(new State({'isUnauthorizedError': true}));
               verify(mockDialog.showModal());
            });

            test('Should not try to open dialog if it is already open', () {
               onStateChange(new State({'isUnauthorizedError': true}));
               verify(mockDialog.showModal());
   
               onStateChange(new State({'isUnauthorizedError': true}));
               verifyNever(mockDialog.showModal());
               
               component.onClose();

               onStateChange(new State({'isUnauthorizedError': true}));
               verify(mockDialog.showModal());
            });
            
            test('Should not open dialog if no error', () {
               onStateChange(new State({'isUnauthorizedError': false}));
               verifyNever(mockDialog.showModal());
            });
         });

         group('On sign in click', () {
            setUp((){
               component.ngOnInit();

               var signInAction = component.dialogActions[0];
               signInAction.execute();
            });

            test('Should go to login page', () {
               verify(mockRouter.navigate(['Login']));
            });

            test('Should close dialog', () {
               verify(mockDialog.close());
            });
         });

         test('Should clear unauthorized state on close', () {
            component.onClose();
            
            var isRemoveErrorAction = argThat(predicate((action) => action.type == ERROR_REMOVE_UNAUTHORIZED));
            verify(mockStore.dispatch(isRemoveErrorAction));
         });
      });
   }

   static _mockSubscription(mockStore) {

      var filteredStream = getStream();

      var hasUnauthorizedError = predicate((f) => f(new State({'isUnauthorizedError': {}})));

      when(mockStore.where(hasUnauthorizedError)).thenReturn(filteredStream);
      return filteredStream;
   }
}

void main() {
   UnauthorizedErrorTests.run();
}
