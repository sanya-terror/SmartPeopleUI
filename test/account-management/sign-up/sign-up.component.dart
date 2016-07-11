import 'dart:html';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:angular2_testing/angular2_testing.dart';
import 'package:SmartPeopleUI/index.dart';
import '../../helpers/angular.dart' as ng;
import '../../helpers/mocks.dart';
import '../../helpers/matchers.dart';

class SignUpComponentTests {
  static run() {
    group('Sign up component view', () {

      ng.initAngularTests();

      ng.setUpProviders(SignUpComponent);

      SignUpComponent _component;
      Element _element;
      ComponentFixture _fixture;

      ngSetUp((TestComponentBuilder tcb) async {
        _fixture  = await tcb
            .overrideDirective(SignUpComponent, LinkComponent, EmptyComponent)
            .createAsync(SignUpComponent);
        _component = _fixture.componentInstance;
        _element = _fixture.nativeElement;
      });

      ngTest('Should init correcr view', ()  {

        _fixture.detectChanges();

        var baseSelector = 'div.sign-up > sp-card.sign-up-card';

        expect(_element.querySelector('$baseSelector[title]'), isNotNull, reason: 'No title found');
        expect(_element.querySelector('$baseSelector .content'), isNotNull, reason: 'No content found');
        expect(_element.querySelector('$baseSelector .extra-actions'), isNotNull, reason: 'No extra actions found');
      });

      var testCases = [
        {
          'state': { 'isFormSent': false, 'isConfirmationCodeResent': false, 'isConfirmationCodeResentError': false},
          'resultSelectors': { 'form': isNotNull, 'code': isNull }
        },
        {
          'state': { 'isFormSent': true, 'isConfirmationCodeResent': false, 'isConfirmationCodeResentError': false},
          'resultSelectors': { 'form': isNull, 'code': isNotNull }
        },
        {
          'state': { 'isFormSent': true, 'isConfirmationCodeResent': true, 'isConfirmationCodeResentError': false},
          'resultSelectors': { 'form': isNull, 'code': isNotNull }
        },
        {
          'state': { 'isFormSent': true, 'isConfirmationCodeResent': false, 'isConfirmationCodeResentError': true},
          'resultSelectors': { 'form': isNull, 'code': isNotNull }
        }
      ];

      testCases.forEach((testCase){
        var state = testCase['state'];
        var resultSelectors = testCase['resultSelectors'];

        ngTest('Should apply correct view state. State: $state', ()  {

          _component.isFormSent = state['isFormSent'];
          _component.isConfirmationCodeResent = state['isConfirmationCodeResent'];
          _component.isConfirmationCodeResentError = state['isConfirmationCodeResentError'];

          _fixture.detectChanges();

          expect(_element.querySelector('.content sp-sign-up-form'), resultSelectors['form'],
            reason: 'Wrong sign up form component state');
          expect(_element.querySelector('.content sp-sign-up-code'), resultSelectors['code'],
            reason: 'Wrong sign up code component state');
        });
      });
    });

    group('Sign up access component', () {

      var mockStore;

      SignUpComponent component;
      setUp((){
        mockStore = getMockStore();
        component = new SignUpComponent(mockStore);
      });

      test('Should subscribe on change during initialization', () {
        var subscriptionStream = _mockSubscription(mockStore);
        component.ngOnInit();
        expect(verify(subscriptionStream.listen(captureAny)).callCount, 1);
      });

      group('On state change', () {

        var onStateChange;

        setUp((){
          var subscriptionStream = _mockSubscription(mockStore);
          component.ngOnInit();
          onStateChange = verify(subscriptionStream.listen(captureAny)).captured[0];
        });

        test('Should change component state base on signUp object in new state', () {

          var data = new SignUpData()
            ..errorCode = null
            ..isConfirmationCodeResent = false;
          onStateChange(data);

          expect(component.isFormSent, true);
          expect(component.isConfirmationCodeResent, false);
          expect(component.isConfirmationCodeResentError, false);

          data = new SignUpData()
            ..errorCode = 3333
            ..isConfirmationCodeResent = false;
          onStateChange(data);

          expect(component.isFormSent, false);
          expect(component.isConfirmationCodeResent, false);
          expect(component.isConfirmationCodeResentError, false);

          data = new SignUpData()
            ..errorCode = null
            ..isConfirmationCodeResent = true;
          onStateChange(data);

          expect(component.isFormSent, true);
          expect(component.isConfirmationCodeResent, true);
          expect(component.isConfirmationCodeResentError, false);

          data = new SignUpData()
            ..errorCode = null
            ..isConfirmationCodeResent = false;
          onStateChange(data);

          expect(component.isFormSent, true);
          expect(component.isConfirmationCodeResent, false);
          expect(component.isConfirmationCodeResentError, false);

          data = new SignUpData()
            ..errorCode = 5555
            ..isConfirmationCodeResent = false;
          onStateChange(data);

          expect(component.isFormSent, true);
          expect(component.isConfirmationCodeResent, false);
          expect(component.isConfirmationCodeResentError, true);
        });
      });

      test('Should set default on destroy component', () {
        component.ngOnDestroy();
        expect(verify(mockStore.dispatch(argThat(predicate((action) => action.type == SIGN_UP_CLEAR_DATA)))).callCount, 1);
      });

      test('Should set default', () {
        component.setDefault();
        expect(verify(mockStore.dispatch(argThat(predicate((action) => action.type == SIGN_UP_CLEAR_DATA)))).callCount, 1);
      });
    });
  }

  static _mockSubscription(mockStore) {

    var mappedStream = getStream();
    var filteredStream = getStream();

    var signUpMapPredicate = predicate((f) {
      var data = new SignUpData();
      var state = new State({'signUp': data});
      return f(state) == data;
    });

    when(mockStore.map(signUpMapPredicate)).thenReturn(mappedStream);
    when(mappedStream.where(notNullPredicate)).thenReturn(filteredStream);
    return filteredStream;
  }
}

void main() {
  SignUpComponentTests.run();
}
