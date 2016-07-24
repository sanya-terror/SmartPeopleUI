import 'dart:html';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/mocks.dart' as mocks;
import '../helpers/angular.dart' as ng;

import 'package:SmartPeopleUI/index.dart';

import 'package:angular2_testing/angular2_testing.dart';
import 'package:SmartPeopleUI/shared/components/controls/dialog/dialog-manager.dart';


class MockDialogComponent extends Mock implements DialogComponent {
   noSuchMethod(i) => super.noSuchMethod(i);
}

class UnhandledErrorTests {

   static run() {

      group('Unhandled error component view', () {

         ng.initAngularTests();

         ng.setUpProviders(UnhandledErrorComponent, [DialogManager]);

         UnhandledErrorComponent _component;
         Element _element;
         ComponentFixture _fixture;

         ngSetUp((TestComponentBuilder tcb) async{
            _fixture  = await tcb.createAsync(UnhandledErrorComponent);
            _component = _fixture.componentInstance;
            _element = _fixture.nativeElement;
         });

         ngTest('Should not show error and stack trace details initially', () {
            _fixture.detectChanges();
            expect(_element.querySelector('#error'), isNull);
            expect(_element.querySelector('#stack-trace'), isNull);
         });

         group('Error details', (){
            ngTest('Should change elements visibility according to state', () {
               _fixture.detectChanges();
               expect(_component.isErrorShown, false);
               expect(_element.querySelector('#hide-error'), isNull);
               expect(_element.querySelector('#show-error'), isNotNull);
               expect(_element.querySelector('#error'), isNull);

               _component.isErrorShown = true;
               _fixture.detectChanges();
               expect(_element.querySelector('#hide-error'), isNotNull);
               expect(_element.querySelector('#show-error'), isNull);
               expect(_element.querySelector('#error'), isNotNull);
            });

            ngTest('Should state on button click', () {
               _fixture.detectChanges();
               expect(_component.isErrorShown, false);

               var showErrorButton = _element.querySelector('#show-error');
               showErrorButton.click();

               expect(_component.isErrorShown, true);

               _fixture.detectChanges();
               var hideErrorButton = _element.querySelector('#hide-error');
               hideErrorButton.click();

               expect(_component.isErrorShown, false);
            });

            ngTest('Should set errors details to appropriate field', () {
               _component.error = 'Some cool error!';
               _component.isErrorShown = true;

               _fixture.detectChanges();
               var errorDetails = _element.querySelector('#error');

               expect(errorDetails.text, _component.error);
            });
         });

         group('Stack trace details', (){
            ngTest('Should change elements visibility according to state', () {
               _fixture.detectChanges();
               expect(_component.isStackTraceShown, false);
               expect(_element.querySelector('#hide-stack-trace'), isNull);
               expect(_element.querySelector('#show-stack-trace'), isNotNull);
               expect(_element.querySelector('#stack-trace'), isNull);

               _component.isStackTraceShown = true;
               _fixture.detectChanges();
               expect(_element.querySelector('#hide-stack-trace'), isNotNull);
               expect(_element.querySelector('#show-stack-trace'), isNull);
               expect(_element.querySelector('#stack-trace'), isNotNull);
            });

            ngTest('Should state on button click', () {
               _fixture.detectChanges();
               expect(_component.isStackTraceShown, false);

               var showStackTraceButton = _element.querySelector('#show-stack-trace');
               showStackTraceButton.click();

               expect(_component.isStackTraceShown, true);

               _fixture.detectChanges();
               var hideStackTraceButton = _element.querySelector('#hide-stack-trace');
               hideStackTraceButton.click();

               expect(_component.isStackTraceShown, false);
            });

            ngTest('Should set stack trace details to appropriate field', () {
               var stackTrace = StackTrace.current;
               _component.stackTrace = stackTrace;
               _component.isStackTraceShown = true;

               var expected = stackTrace.toString();

               _fixture.detectChanges();
               var stackTraceDetails = _element.querySelector('#stack-trace');

               expect(stackTraceDetails.text, expected);
            });
         });
      });

      group('Unhandled error component', () {

         var mockStore = mocks.getMockStore();
         DialogComponent mockDialog;

         UnhandledErrorComponent component;
         setUp((){
            component = new UnhandledErrorComponent(mockStore);

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
            
            test('Should not try to open dialog if it is already open', () async {
               
               onStateChange(new State({'isInternalServerError': true}));
               verify(mockDialog.showModal());

               onStateChange(new State({'isInternalServerError': true}));
               verifyNever(mockDialog.showModal());
               
               await component.onClose();
               
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

         test('Should close dialog on close button click', () async {

            component.ngOnInit();

            var closeAction = component.dialogActions[0];
            await closeAction.execute();
            
            verify(mockDialog.close());
         });
         
         group('On close', () {
            setUp(()async {
               component.onClose();
            });

            test('Should clear bad request state', () {
               var isRemoveErrorAction = argThat(predicate((action) => action.type == ERROR_REMOVE_BAD_REQUEST));
               verify(mockStore.dispatch(isRemoveErrorAction));
            });

            test('Should clear internal server error state', () {
               var isRemoveErrorAction = argThat(predicate((action) => action.type == ERROR_REMOVE_INTERNAL_SERVER));
               verify(mockStore.dispatch(isRemoveErrorAction));
            });
         });

         test('Should show error details', () {
            expect(component.isErrorShown, false);
            component.showError(true);
            expect(component.isErrorShown, true);
            component.showError(false);
            expect(component.isErrorShown, false);
         });

         test('Should show stack strace details', () {
            expect(component.isStackTraceShown, false);
            component.showStackTrace(true);
            expect(component.isStackTraceShown, true);
            component.showStackTrace(false);
            expect(component.isStackTraceShown, false);
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
