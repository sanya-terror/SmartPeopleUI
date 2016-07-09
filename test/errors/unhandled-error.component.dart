import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/mocks.dart' as mocks;

import 'package:SmartPeopleUI/index.dart';

class MockDialogComponent extends Mock implements DialogComponent {
   noSuchMethod(i) => super.noSuchMethod(i);
}

class UnhandledErrorTests {

   static run() {
      group('Unhandled error component', () {

         var mockStore = mocks.getMockStore();
         DialogComponent mockDialog = spy(new MockDialogComponent(), new DialogComponent());

         UnhandledErrorComponent component;
         setUp((){
            component = new UnhandledErrorComponent(mockStore);

            when(mockDialog.showModal()).thenReturn({});
            when(mockDialog.close()).thenReturn({});
            component.dialog = mockDialog;
         });

         group('On init',() {
            test('Should add dialog actions', () {
               component.ngOnInit();

               List<DialogAction> actions = component.dialogActions;
               expect(actions.length, 1);
               expect(actions[0].title, 'Close');
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

            test('Should open dialog if bad request error', () {
               onStateChange(new State({'isBadRequestError': true}));
               verify(mockDialog.showModal());
            });

            test('Should open dialog if internal server error', () {
               onStateChange(new State({'isInternalServerError': true}));
               verify(mockDialog.showModal());
            });

            test('Should not open dialog if no error', () {
               onStateChange(new State({'isBadRequestError': false, 'isInternalServerError': false}));
               verifyNever(mockDialog.showModal());
            });

            test('Should store error details', () {
               var someError = new Error();
               var newState = new State({
                  'isBadRequestError': true,
                  'errorMessage': 'Error message',
                  'errorStackTrace': someError.stackTrace
               });
               onStateChange(newState);

               expect(component.error, newState['errorMessage']);
               expect(component.stackTrace, newState['errorStackTrace']);
            });
         });

         group('On close click', () {
            setUp((){
               component.ngOnInit();

               var closeAction = component.dialogActions[0];
               closeAction.execute();
            });

            test('Should clear bad request state', () {
               var isRemoveErrorAction = argThat(predicate((action) => action.type == ERROR_REMOVE_BAD_REQUEST));
               verify(mockStore.dispatch(isRemoveErrorAction));
            });

            test('Should clear internal server error state', () {
               var isRemoveErrorAction = argThat(predicate((action) => action.type == ERROR_REMOVE_INTERNAL_SERVER));
               verify(mockStore.dispatch(isRemoveErrorAction));
            });

            test('Should close dialog', () {
               verify(mockDialog.close());
            });
         });

      });
   }

   static _mockSubscription(mockStore) {

      var filteredStream = mocks.getStream();

      var hasUnhandledError = predicate((f) =>
         f(new State({'isBadRequestError': {}})) && f(new State({'isInternalServerError': {}}))
      );

      when(mockStore.where(hasUnhandledError)).thenReturn(filteredStream);
      return filteredStream;
   }
}

void main() {
   UnhandledErrorTests.run();
}
