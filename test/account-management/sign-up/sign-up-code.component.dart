import 'dart:html';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:angular2_testing/angular2_testing.dart';
import 'package:SmartPeopleUI/index.dart';
import '../../helpers/angular.dart' as ng;
import '../../helpers/mocks.dart';
import '../../helpers/matchers.dart';

class SignUpCodeComponentTests {
  static run() {
    group('Sign up code component view', () {
      ng.initAngularTests();

      ng.setUpProviders(SignUpCodeComponent);

      SignUpCodeComponent _component;
      Element _element;
      ComponentFixture _fixture;

      ngSetUp((TestComponentBuilder tcb) async {
        _fixture = await tcb.createAsync(SignUpCodeComponent);
        _component = _fixture.componentInstance;
        _element = _fixture.nativeElement;
      });

      ngTest('Should init correcr view', () {
        _fixture.detectChanges();

        expect(_element.querySelector('form .description'), isNotNull, reason: 'No description found');
        expect(_element.querySelector('form sp-input[name="code"]'), isNotNull, reason: 'No input found');
        expect(_element.querySelector('form sp-input[name="code"] .error'), isNull, reason: 'Input error is found');
        expect(_element.querySelector('form sp-button'), isNotNull, reason: 'No button found');
      });

      var testCases = [
        {'isApplyingCodeError': true, 'result': isNotNull},
        {'isApplyingCodeError': false, 'result': isNull}
      ];

      testCases.forEach((testCase) {
        var isApplyingCodeError = testCase['isApplyingCodeError'];
        var result = testCase['result'];

        ngTest('Should show isUserAlreadyExists error: $isApplyingCodeError', () {
          _component.isApplyingCodeError = isApplyingCodeError;
          _fixture.detectChanges();
          expect(_element.querySelector('form sp-input .error'), result);
        });
      });
    });

    group('Sign up code component', () {
      var mockStore;
      var code = 'QWERTY12';

      SignUpCodeComponent component;
      setUp(() {
        mockStore = getMockStore();
        component = new SignUpCodeComponent(mockStore);
        component.codeControl.updateValue(code);
      });

      test('Should add codeControl to form group', () {
        expect(component.form.controls['code'], component.codeControl);
      });

      group('On state change', () {
        var onStateChange;

        setUp(() {
          var subscriptionStream = _mockSubscription(mockStore);
          component.confirmCode();
          onStateChange = verify(subscriptionStream.listen(captureAny)).captured[0];
        });

        test('Should show notification if applying code error', () {
          var data = new SignUpData()..errorCode = 4444;
          onStateChange(data);
          expect(component.isApplyingCodeError, true);
        });

        test('Should not show notification if no applying code error', () {
          var data = new SignUpData()..errorCode = null;
          onStateChange(data);

          expect(component.isApplyingCodeError, false);
        });

        test('Should clear sign up data after confirm code action success', () {
          var data = new SignUpData()..errorCode = null;
          onStateChange(data);

          var isValidClearDataAction = predicate((action) => action.type == SIGN_UP_CLEAR_DATA);
          expect(verify(mockStore.dispatch(argThat(isValidClearDataAction))).callCount, 1);
        });

        test('Should execute login request action', () {
          String email = 'test@test.com';
          String password = '1q2w3e4r';
          when(mockStore.state).thenReturn(new State({'email': email}));

          var data = new SignUpData()..password = '1q2w3e4r';
          onStateChange(data);

          var isValidLoginRequestAction = predicate((action) {
            return action.type == LOGIN_REQUEST && action.data['user'] == email && action.data['password'] == password;
          });
          expect(verify(mockStore.dispatch(argThat(isValidLoginRequestAction))).callCount, 1);
        });
      });

      test('Should confirm code', () {
        component.confirmCode();

        var isValidConfirmCodeAction =
            predicate((action) => action.type == SIGN_UP_APPLY_CONFIRMATION_CODE && action.data['code'] == code);
        expect(verify(mockStore.dispatch(argThat(isValidConfirmCodeAction))).callCount, 1);
      });

      test('Should not apply code and subscribe when form is invalid', () {
        component.form.setErrors({'some_error': 'error'});

        var subscriptionStream = _mockSubscription(mockStore);

        component.confirmCode();

        verifyNever(subscriptionStream.listen(argThat(anything)));
        verifyNever(mockStore.dispatch(anything));
      });
    });
  }

  static _mockSubscription(mockStore) {
    var mappedStream = getStream();
    var filteredStream = getStream();
    var takenStream = getStream();

    var signUpMapPredicate = predicate((f) {
      var data = new SignUpData();
      var state = new State({'signUp': data});
      return f(state) == data;
    });

    when(mockStore.map(signUpMapPredicate)).thenReturn(mappedStream);
    when(mappedStream.where(notNullPredicate)).thenReturn(filteredStream);
    when(filteredStream.take(1)).thenReturn(takenStream);
    return takenStream;
  }
}

void main() {
  SignUpCodeComponentTests.run();
}
