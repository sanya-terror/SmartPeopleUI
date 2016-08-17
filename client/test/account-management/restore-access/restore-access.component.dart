import 'dart:html';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:angular2_testing/angular2_testing.dart';

import 'package:smartpeople_client/index.dart';
import '../../helpers/angular.dart' as ng;
import '../../helpers/mocks.dart';
import '../../helpers/matchers.dart';

class RestoreAccessComponentTests {
  static run() {
    group('Restore access component view', () {
      ng.initAngularTests();

      ng.setUpProviders(RestoreAccessComponent);

      RestoreAccessComponent _component;
      Element _element;
      ComponentFixture _fixture;

      ngSetUp((TestComponentBuilder tcb) async {
        _fixture = await tcb.createAsync(RestoreAccessComponent);
        _component = _fixture.componentInstance;
        _element = _fixture.nativeElement;
      });

      ngTest('Should init correcr view', () {
        _fixture.detectChanges();

        var baseSelector = 'div.restore-access > sp-card.restore-access-card';

        expect(_element.querySelector('$baseSelector[title]'), isNotNull, reason: 'No title found');
        expect(_element.querySelector('$baseSelector .content'), isNotNull, reason: 'No content found');
      });

      var testCases = [
        {
          'state': {'isCodeSent': true, 'isCodeApplied': true},
          'resultSelectors': {'code': isNull, 'email': isNull, 'password': isNotNull}
        },
        {
          'state': {'isCodeSent': true, 'isCodeApplied': false},
          'resultSelectors': {'code': isNotNull, 'email': isNull, 'password': isNull}
        },
        {
          'state': {'isCodeSent': false, 'isCodeApplied': true},
          'resultSelectors': {'code': isNull, 'email': isNull, 'password': isNotNull}
        },
        {
          'state': {'isCodeSent': false, 'isCodeApplied': false},
          'resultSelectors': {'code': isNull, 'email': isNotNull, 'password': isNull}
        },
      ];

      testCases.forEach((testCase) {
        var state = testCase['state'];
        var resultSelectors = testCase['resultSelectors'];

        ngTest('Should apply correct view state. State: $state', () {
          _component.isCodeSent = state['isCodeSent'];
          _component.isCodeApplied = state['isCodeApplied'];

          _fixture.detectChanges();

          expect(_element.querySelector('.content sp-restore-access-email'), resultSelectors['email'],
              reason: 'Wrong input email component state');
          expect(_element.querySelector('.content sp-restore-access-code'), resultSelectors['code'],
              reason: 'Wrong input code component state');
          expect(_element.querySelector('.content sp-change-password'), resultSelectors['password'],
              reason: 'Wrong change password component state');
        });
      });
    });

    group('Restore access component', () {
      var mockStore;

      RestoreAccessComponent component;
      setUp(() {
        mockStore = getMockStore();
        component = new RestoreAccessComponent(mockStore);
      });

      test('Should subscribe on change during initialization', () {
        var subscriptionStream = _mockSubscription(mockStore);
        component.ngOnInit();
        expect(verify(subscriptionStream.listen(captureAny)).callCount, 1);
      });

      group('On state change', () {
        var onStateChange;

        setUp(() {
          var subscriptionStream = _mockSubscription(mockStore);
          component.ngOnInit();
          onStateChange = verify(subscriptionStream.listen(captureAny)).captured[0];
        });

        test('Should change component state base on restoreAccess object in new state', () {
          var data = new RestoreAccessData()..isCodeSent = true;
          onStateChange(data);

          expect(component.isCodeSent, true);
          expect(component.isCodeApplied, false);

          data = new RestoreAccessData()..changePasswordToken = 'some_token';
          onStateChange(data);

          expect(component.isCodeSent, false);
          expect(component.isCodeApplied, true);

          data = new RestoreAccessData()
            ..isCodeSent = true
            ..changePasswordToken = 'some_token';
          onStateChange(data);

          expect(component.isCodeSent, true);
          expect(component.isCodeApplied, true);
        });
      });

      test('Should set default on destroy component', () {
        component.ngOnDestroy();
        expect(
            verify(mockStore.dispatch(argThat(predicate((action) => action.type == RESTORE_ACCESS_CLEAR_DATA))))
                .callCount,
            1);
      });

      test('Should set default', () {
        component.setDefault();
        expect(
            verify(mockStore.dispatch(argThat(predicate((action) => action.type == RESTORE_ACCESS_CLEAR_DATA))))
                .callCount,
            1);
      });
    });
  }

  static _mockSubscription(mockStore) {
    var mappedStream = getStream();
    var filteredStream = getStream();

    var restoreAccessMapPredicate = predicate((f) {
      var data = new RestoreAccessData();
      var state = new State({'restoreAccess': data});
      return f(state) == data;
    });

    when(mockStore.map(restoreAccessMapPredicate)).thenReturn(mappedStream);
    when(mappedStream.where(notNullPredicate)).thenReturn(filteredStream);
    return filteredStream;
  }
}

void main() {
  RestoreAccessComponentTests.run();
}
