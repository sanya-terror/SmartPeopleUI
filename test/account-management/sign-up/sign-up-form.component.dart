import 'dart:html';

import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:angular2_testing/angular2_testing.dart';

import 'package:SmartPeopleUI/index.dart';
import '../../helpers/angular.dart' as ng;
import '../../helpers/mocks.dart';
import '../../helpers/matchers.dart';

class SignUpFormComponentTests {
  static run() {
    group('Sign up form component view', () {

      ng.initAngularTests();

      ng.setUpProviders(SignUpFormComponent);

      SignUpFormComponent _component;
      Element _element;
      ComponentFixture _fixture;

      ngSetUp((TestComponentBuilder tcb) async{
        _fixture  = await tcb.createAsync(SignUpFormComponent);
        _component = _fixture.componentInstance;
        _element = _fixture.nativeElement;
      });

      ngTest('Should init correcr view', ()  {

        _fixture.detectChanges();

        expect(_element.querySelector('form sp-input[name="name"]'), isNotNull, reason: 'No name input found');
        expect(_element.querySelector('form sp-input[name="name"] .error'), isNull, reason: 'Name input error is found');
        expect(_element.querySelector('form sp-input[name="surname"]'), isNotNull, reason: 'No surname input found');
        expect(_element.querySelector('form sp-input[name="surname"] .error'), isNull, reason: 'Surname input error is found');
        expect(_element.querySelector('form sp-input[name="email"]'), isNotNull, reason: 'No email input found');
        expect(_element.querySelector('form sp-input[name="email"] .error'), isNull, reason: 'Email input error is found');
        expect(_element.querySelector('form sp-input[name="password"]'), isNotNull, reason: 'No password input found');
        expect(_element.querySelector('form sp-input[name="parrword"] .error'), isNull, reason: 'Password input error is found');
        expect(_element.querySelector('form sp-input[name="password-repeat"]'), isNotNull, reason: 'No repeat password input found');
        expect(_element.querySelector('form sp-input[name="password-repeat"] .error'), isNull, reason: 'Repeat password input error is found');
        expect(_element.querySelector('form sp-radio[label="Male"]'), isNotNull, reason: 'No repeat password input found');
        expect(_element.querySelector('form sp-radio[label="Female"]'), isNotNull, reason: 'No repeat password input found');

        expect(_element.querySelector('form sp-button'), isNotNull, reason: 'No button found');
      });

      var testCases = [
        { 'isUserAlreadyExists': true, 'result': isNotNull},
        { 'isUserAlreadyExists': false, 'result': isNull}
      ];

      testCases.forEach((testCase){
        var isUserAlreadyExists = testCase['isUserAlreadyExists'];
        var result = testCase['result'];

        ngTest('Should show isUserAlreadyExists error: $isUserAlreadyExists', ()  {
          _component.isUserAlreadyExists = isUserAlreadyExists;
          _fixture.detectChanges();
          expect(_element.querySelector('form sp-input[name="email"] .error'), result);
        });
      });

    });

    group('Sign up form component', () {

      var mockStore;
      var data = {
        'name': 'John',
        'surname': 'Doe',
        'email': 'test@test.com',
        'password': '1q2w3e4r',
        'passwordRepeat': '1q2w3e4r',
        'sex': 'male'
      };

      SignUpFormComponent component;
      setUp((){
        mockStore = getMockStore();
        component = new SignUpFormComponent(mockStore);
        component.nameControl.updateValue(data['name']);
        component.surnameControl.updateValue(data['surname']);
        component.emailControl.updateValue(data['email']);
        component.passwordControl.updateValue(data['password']);
        component.passwordRepeatControl.updateValue(data['passwordRepeat']);
        component.sexControl.updateValue(data['sex']);
      });

      test('Should add controls to form group', () {
        expect(component.form.controls['name'], component.nameControl);
        expect(component.form.controls['surname'], component.surnameControl);
        expect(component.form.controls['email'], component.emailControl);
        expect(component.form.controls['password'], component.passwordControl);
        expect(component.form.controls['passwordRepeat'], component.passwordRepeatControl);
        expect(component.form.controls['sex'], component.sexControl);
      });

      test('Should subscribe on change during initialization', () async {
        var subscriptionStream = _mockSubscription(mockStore);

        component.ngOnInit();

        var onStateChange = verify(subscriptionStream.listen(captureAny)).captured[0];

        var data = new SignUpData()..errorCode = 3333;
        onStateChange(data);

        expect(component.isUserAlreadyExists, true);
      });

      test('Should send form', () async {

        await component.sendForm();

        var isValidSendSignUpFormAction = predicate((action) {
          var actionData = action.data['signUpData'];

          return action.type == SIGN_UP_SEND_DATA
              && actionData['name'] == data['name']
              && actionData['surname'] == data['surname']
              && actionData['user'] == data['email']
              && actionData['password'] == data['password']
              && actionData['sex'] == data['sex'];
        });

        expect(verify(mockStore.dispatch(argThat(isValidSendSignUpFormAction))).callCount, 1);

        var isValidSaveEmailAction = predicate((action) => action.type == SAVE_EMAIL && action.data['email'] == data['email']);
        expect(verify(mockStore.dispatch(argThat(isValidSaveEmailAction))).callCount, 1);

        var isValidSavePasswordAction = predicate((action) => action.type == SIGN_UP_SAVE_PASSWORD && action.data['password'] == data['password']);
        expect(verify(mockStore.dispatch(argThat(isValidSavePasswordAction))).callCount, 1);
      });

      test('Should not send sign up form and subscribe when form is invalid', () async {

        component.form.setErrors({'some_error': 'error'});

        var subscriptionStream = _mockSubscription(mockStore);

        await component.sendForm();

        verifyNever(subscriptionStream.listen(argThat(anything)));
        verifyNever(mockStore.dispatch(anything));
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
  SignUpFormComponentTests.run();
}
