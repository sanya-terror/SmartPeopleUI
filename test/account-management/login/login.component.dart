import 'dart:html';
import 'dart:mirrors';

import 'package:test/test.dart';
import 'package:angular2/common.dart';

@MirrorsUsed()
import 'package:mockito/mockito.dart';
import 'package:SmartPeopleUI/index.dart';
import 'package:angular2_testing/angular2_testing.dart';

import '../../helpers/angular.dart' as ng;
import '../../helpers/mocks.dart';

class MockNgControlName extends Mock implements NgControlName {
  noSuchMethod(i) => super.noSuchMethod(i);
}

class LoginComponentTests {
  static run() {
    group('Login component view', () {

      ng.initAngularTests();

      ng.setUpProviders(LoginComponent);

      LoginComponent _component;
      Element _element;
      ComponentFixture _fixture;

      ngSetUp((TestComponentBuilder tcb) async{
        _fixture  = await tcb.overrideDirective(LoginComponent, LinkComponent, EmptyComponent)
            .createAsync(LoginComponent);
        _component = _fixture.componentInstance;
        _element = _fixture.nativeElement;
      });

      ngTest('Should init correcr view', ()  {

        _fixture.detectChanges();

        var baseSelector = 'div.login > sp-card.login-card';

        expect(_element.querySelector('$baseSelector[title]'), isNotNull, reason: 'No title found');
        expect(_element.querySelector('$baseSelector .notification.error'), isNull, reason: 'No notification error found');
        expect(_element.querySelector('$baseSelector .content'), isNotNull, reason: 'No content found');
        expect(_element.querySelector('$baseSelector .content sp-input[name="email"]'), isNotNull, reason: 'No email input found');
        expect(_element.querySelector('$baseSelector .content sp-input[name="email"] .error'), isNull, reason: 'No email input error found');
        expect(_element.querySelector('$baseSelector .content sp-input[name="password"]'), isNotNull, reason: 'No password input found');
        expect(_element.querySelector('$baseSelector .content sp-input[name="password"] .error'), isNull, reason: 'No password input error found');
        expect(_element.querySelector('$baseSelector .content sp-button'), isNotNull, reason: 'No button found');
        expect(_element.querySelector('$baseSelector .content sp-checkbox'), isNotNull, reason: 'No checkbox found');
        expect(_element.querySelector('$baseSelector .extra-actions'), isNotNull, reason: 'No extra actions found');
        expect(_element.querySelector('$baseSelector .extra-actions #sign-up'), isNotNull, reason: 'No sign up link found');
        expect(_element.querySelector('$baseSelector .extra-actions #restore-access'), isNotNull, reason: 'No restore access link found');
      });

      var testCases = [
        {
          'state': { 'isInvalidCredentialsError': false },
          'resultSelectors': {'notification': isNull }
        },
        {
          'state': { 'isInvalidCredentialsError': true },
          'resultSelectors': {'notification': isNotNull }
        }
      ];

      testCases.forEach((testCase){
        var state = testCase['state'];
        var resultSelectors = testCase['resultSelectors'];

        ngTest('Should apply correct view state. State: $state', ()  {

          _component.isInvalidCredentialsError = state['isInvalidCredentialsError'];

          _fixture.detectChanges();

          expect(_element.querySelector('.notification.error'), resultSelectors['notification'], reason: 'Wrong notification error component state');
        });
      });
    });

    group('Login component', () {

      var mockStore;
      var subscriptionStream;

      var data = {
        'user': 'test@test.com',
        'password': '1q2w3e4r',
        'rememberMe': true
      };

      LoginComponent component;

      setUp(() {
        mockStore = getMockStore();
        component = new LoginComponent(mockStore);
        component.emailControl.updateValue(data['user']);
        component.passwordControl.updateValue(data['password']);
        component.rememberMeControl.updateValue(data['rememberMe']);
        subscriptionStream = _mockSubscription(mockStore);
      });

      test('Should add controls to form group', () {
        expect(component.form.controls['email'], component.emailControl);
        expect(component.form.controls['password'], component.passwordControl);
        expect(component.form.controls['rememberMe'], component.rememberMeControl);
      });

      test('Should subscribe on change during initialization', () async {
        int error = 7777;

        component.login();

        var onStateChange = verify(subscriptionStream.listen(captureAny)).captured[0];

        when(mockStore.state).thenReturn(new State({'errorCode': error}));
        onStateChange(mockStore.state);
        expect(component.isInvalidCredentialsError, true);

        when(mockStore.state).thenReturn(new State({'errorCode': null}));
        onStateChange(mockStore.state);
        expect(component.isInvalidCredentialsError, false);
      });

      test('Should clear control values', () {
        component.login();

        var onStateChange = verify(subscriptionStream.listen(captureAny)).captured[0];

        when(mockStore.state).thenReturn(new State({'errorCode': null}));
        onStateChange(mockStore.state);

        expect(component.form.controls['email'].value, '');
        expect(component.form.controls['password'].value, '');
        expect(component.form.controls['rememberMe'].value, '');
      });

      test('Should set control errors to null', () {
        component.login();

        var onStateChange = verify(subscriptionStream.listen(captureAny)).captured[0];

        when(mockStore.state).thenReturn(new State({'errorCode': null}));
        onStateChange(mockStore.state);

        expect(component.form.controls['email'].errors, null);
        expect(component.form.controls['password'].errors, null);
        expect(component.form.controls['rememberMe'].errors, null);
      });

      test('Should request login during login action', () {
        component.login();

        var isRequestLoginAction = predicate((action) {
          return action.type == LOGIN_REQUEST
              && action.data['user'] == data['user']
              && action.data['password'] == data['password']
              && action.data['rememberMe'] == data['rememberMe'];
        });

        expect(verify(mockStore.dispatch(argThat(isRequestLoginAction))).callCount, 1);
      });

      test('Should subscribe on change during login action', () {
        var subscriptionStream = _mockSubscription(mockStore);

        component.login();
        expect(verify(subscriptionStream.listen(captureAny)).callCount, 1);
      });
    });
  }

  static _mockSubscription(mockStore) {
    var takenStream = getStream();

    when(mockStore.take(1)).thenReturn(takenStream);
    return takenStream;

  }

}

void main() {
  LoginComponentTests.run();
}
