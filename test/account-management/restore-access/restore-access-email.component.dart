import 'dart:html';

import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:angular2/common.dart';
import 'package:angular2/core.dart';
import 'package:angular2_testing/angular2_testing.dart';
import 'package:angular2/testing.dart' show fakeAsync, flushMicrotasks, tick;

import 'package:SmartPeopleUI/index.dart';
import '../../helpers/angular.dart' as ng;
import '../../helpers/mocks.dart';
import '../../helpers/matchers.dart';

class RestoreAccessEmailComponentTests {
  static run() {
    group('Restore access email component view', () {

      ng.initAngularTests();

      ng.setUpProviders(RestoreAccessEmailComponent);

      RestoreAccessEmailComponent _component;
      Element _element;
      ComponentFixture _fixture;

      ngSetUp((TestComponentBuilder tcb) async{
        _fixture  = await tcb.createAsync(RestoreAccessEmailComponent);
        _component = _fixture.componentInstance;
        _element = _fixture.nativeElement;
      });

      ngTest('Should init correcr view', ()  {

        _fixture.detectChanges();

        expect(_element.querySelector('form .description'), isNotNull, reason: 'No description found');
        expect(_element.querySelector('form sp-input .error'), isNull, reason: 'Error found');
        expect(_element.querySelector('form sp-input'), isNotNull, reason: 'No input found');
        expect(_element.querySelector('form sp-button'), isNotNull, reason: 'No button found');
      });

      var testCases = [
        { 'isUserNotFound': true, 'result': isNotNull},
        { 'isUserNotFound': false, 'result': isNull}
      ];

      testCases.forEach((testCase){
        var isUserNotFound = testCase['isUserNotFound'];
        var result = testCase['result'];

        ngTest('Should show isUserNotFound error: $isUserNotFound', ()  {
          _component.isUserNotFound = isUserNotFound;
          _fixture.detectChanges();
          expect(_element.querySelector('form sp-input #user-not-found-error.error'), result);
        });
      });

      // TODO SP-63 Add tests to check if error appears.
      // Need a mechanism to detect if input was changed

//      ngTest('Should show email required error', fakeAsync(()  async {
//
//        var fixture  = await tcb.createAsync(RestoreAccessEmailComponent);
//        var element = fixture.nativeElement;
//
//        flushMicrotasks();
//        fixture.detectChanges();
//
//        InputElement emailInput = element.querySelector('#restore-access-email');
//        emailInput.value = '12';
//        var evt = new Event('input');
//        emailInput.dispatchEvent(evt);
//
//        flushMicrotasks();
//
//        print(element.outerHtml);
////        expect(_element.querySelector('sp-error-tooltip#email-required-error'), isNotNull);
//        expect(element.querySelector('sp-error-tooltip#email-incorrect-error'), isNull);
//      }));

    });

    group('Restore access email component', () {

      var mockStore;
      var email = 'some@email.com';

      RestoreAccessEmailComponent component;
      setUp((){
        mockStore = getMockStore();
        when(mockStore.dispatch(argThat(anything))).thenReturn({});
        component = new RestoreAccessEmailComponent(mockStore);
        component.emailControl.updateValue(email);
      });

      test('Should add emailControl to form group', () {
        expect(component.form.controls['email'], component.emailControl);
      });

      test('Should subscribe on state change when get code', () async {

        var subscriptionStream = _mockSubscription(mockStore);

        await component.getCode();

        var onStateChange = verify(subscriptionStream.listen(captureAny)).captured[0];

        var data = new RestoreAccessData()..errorCode = 1111;
        onStateChange(data);

        expect(component.isUserNotFound, true);

        data = new RestoreAccessData()..errorCode = 2222;
        onStateChange(data);

        expect(component.isUserNotFound, false);
      });

      test('Should get code', () async {

        await component.getCode();

        var isValidSaveEmailAction = predicate((action) => action.type == SAVE_EMAIL && action.data['email'] == email);
        expect(verify(mockStore.dispatch(argThat(isValidSaveEmailAction))).callCount, 1);

        var isValidGetCodeAction = predicate((action) => action.type == GET_RESTORE_CODE && action.data['email'] == email);
        expect(verify(mockStore.dispatch(argThat(isValidGetCodeAction))).callCount, 1);
      });

      test('Should not get code and subscribe when form is invalid', () async {

        component.form.setErrors({'some_error': 'error'});

        var subscriptionStream = _mockSubscription(mockStore);

        await component.getCode();

        verifyNever(subscriptionStream.listen(argThat(anything)));
        verifyNever(mockStore.dispatch(anything));
      });

    });
  }

  static _mockSubscription(mockStore) {

    var mappedStream = getStream();
    var filteredStream = getStream();
    var takenStream = getStream();

    var restoreAccessMapPredicate = predicate((f) {
      var data = new RestoreAccessData();
      var state = new State({'restoreAccess': data});
      return f(state) == data;
    });

    when(mockStore.map(restoreAccessMapPredicate)).thenReturn(mappedStream);
    when(mappedStream.where(notNullPredicate)).thenReturn(filteredStream);
    when(filteredStream.take(1)).thenReturn(takenStream);
    return takenStream;
  }
}

void main() {
  RestoreAccessEmailComponentTests.run();
}
