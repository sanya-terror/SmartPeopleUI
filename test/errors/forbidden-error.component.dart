import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/mocks.dart' as mocks;

import 'package:SmartPeopleUI/index.dart';
import '../helpers/mocks.dart';

class MockDialogComponent extends Mock implements DialogComponent {
  noSuchMethod(i) => super.noSuchMethod(i);
}

class ForbiddenErrorTests {
  static run() {
    group('Forbidden error component', () {
      var mockStore = mocks.getMockStore();
      var mockRouter = mocks.getRouter();
      DialogComponent mockDialog;

      ForbiddenErrorComponent component;

      setUp(() {
        component = new ForbiddenErrorComponent(mockStore, mockRouter);

        mockDialog = spy(new MockDialogComponent(), new DialogComponent());
        when(mockDialog.showModal()).thenReturn({});
        when(mockDialog.close()).thenReturn({});
        component.dialog = mockDialog;
      });

      group('On init', () {
        test('Should add dialog actions', () {
          component.ngOnInit();

          List<DialogAction> actions = component.dialogActions;
          expect(actions.length, 2);
          expect(actions[0].title, 'Sign in');
          expect(actions[1].title, 'Close');
        });

        test('Should subscribe on changes', () {
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
          onStateChange(new State({'isForbiddenError': true}));
          verify(mockDialog.showModal());
        });

        test('Should not try to open dialog if it is already open', () {
          onStateChange(new State({'isForbiddenError': true}));
          verify(mockDialog.showModal());

          onStateChange(new State({'isForbiddenError': true}));
          verifyNever(mockDialog.showModal());

          component.onClose();

          onStateChange(new State({'isForbiddenError': true}));
          verify(mockDialog.showModal());
        });

        test('Should not open dialog if no error', () {
          onStateChange(new State({'isForbiddenError': false}));
          verifyNever(mockDialog.showModal());
        });
      });

      group('Dialog actions ', () {
        setUp(() => component.ngOnInit());

        group('Sign up ', () {
          setUp(() {
            var signInAction = component.dialogActions[0];
            signInAction.execute();
          });

          test('Should go to login page after sign in click action', () {
            verify(mockRouter.navigate(['Login']));
          });

          test('Should close dialog after sign in click action', () {
            verify(mockDialog.close());
          });
        });

        test('Should close dialog after close click action', () {
          var closeAction = component.dialogActions[1];
          closeAction.execute();

          verify(mockDialog.close());
        });
      });

      test('Should clear forbidden state on close', () {
        component.onClose();

        var isRemoveErrorAction = argThat(predicate((action) => action.type == ERROR_REMOVE_FORBIDDEN));
        verify(mockStore.dispatch(isRemoveErrorAction));
      });
    });
  }

  static _mockSubscription(mockStore) {
    var filteredStream = getStream();

    var hasUnauthorizedError = predicate((f) => f(new State({'isForbiddenError': {}})));

    when(mockStore.where(hasUnauthorizedError)).thenReturn(filteredStream);
    return filteredStream;
  }
}

void main() {
  ForbiddenErrorTests.run();
}
