import 'dart:html';

import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:angular2/common.dart';
import 'package:angular2_testing/angular2_testing.dart';
import 'package:angular2/testing.dart' show fakeAsync, flushMicrotasks, tick;

import 'package:SmartPeopleUI/index.dart';
import '../../helpers/angular.dart' as ng;
import '../../helpers/mocks.dart';
import 'package:angular2/core.dart';

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

      var testCases = [
        {
          'state': { 'isUserNotFound': true, 'isInvalidCode': true },
          'resultSelectors': {'enterEmail': isNull, 'userNotFound': isNotNull, 'invalidCode': isNotNull }
        },
        {
          'state': { 'isUserNotFound': true, 'isInvalidCode': false },
          'resultSelectors': {'enterEmail': isNull, 'userNotFound': isNotNull, 'invalidCode': isNull }
        },
        {
          'state': { 'isUserNotFound': false, 'isInvalidCode': true },
          'resultSelectors': {'enterEmail': isNotNull, 'userNotFound': isNull, 'invalidCode': isNotNull }
        },
        {
          'state': { 'isUserNotFound': false, 'isInvalidCode': false },
          'resultSelectors': {'enterEmail': isNotNull, 'userNotFound': isNull, 'invalidCode': isNull }
        },
      ];

      testCases.forEach((testCase){
        var state = testCase['state'];
        var resultSelectors = testCase['resultSelectors'];

        ngTest('Should apply correct view state. State: $state', ()  {

          _component.isUserNotFound = state['isUserNotFound'];
          _component.isInvalidCode = state['isInvalidCode'];

          _fixture.detectChanges();

          expect(_element.querySelector('form #user-not-found-desc'), resultSelectors['userNotFound']);
          expect(_element.querySelector('form #enter-email-desc'), resultSelectors['enterEmail']);
          expect(_element.querySelector('form #invalid-code-error'), resultSelectors['invalidCode']);
          expect(_element.querySelector('sp-error-tooltip'), isNull);
        });
      });

// TODO Add tests to check if notifications appear on errors
//
//      ngTest('Should show email required error', fakeAsync(()  async {

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

      RestoreAccessEmailComponent component;
      setUp((){
        mockStore = getMockStore();
        when(mockStore.dispatch(argThat(anything))).thenReturn({});
        component = new RestoreAccessEmailComponent(mockStore);
      });

      test('Should subscribe on change during initialization', () {
        component.ngOnInit();
        expect(verify(mockStore.listen(argThat(anything))).callCount, 1);
      });

      group('On state change', (){

        var onStateChange;

        setUp((){
          component.ngOnInit();
          onStateChange = verify(mockStore.listen(captureAny)).captured[0];
        });

        test('Should not change component state if no restoreAccess object in new state', () {

          var newState = new State({'restoreAccess': null});
          onStateChange(newState);

          expect(component.isInvalidCode, false);
          expect(component.isUserNotFound, false);
        });

        test('Should change component state base on restoreAccess object in new state', () {

          var newState = new State({'restoreAccess': new RestoreAccessData(isInvalidCode: true)});
          onStateChange(newState);

          expect(component.isInvalidCode, true);
          expect(component.isUserNotFound, false);

          newState = new State({'restoreAccess': new RestoreAccessData(isUserNotFound: true)});
          onStateChange(newState);

          expect(component.isInvalidCode, false);
          expect(component.isUserNotFound, true);
        });
      });

      test('Should add emailControl to form group', () {
        expect(component.form.controls['email'], component.emailControl);
      });

      test('Should get code', () {

        var email = 'test@mail.com';
        component.emailControl = new Control(email);
        component.getCode();

        var isValidAction = predicate((action) => action.type == GET_RESTORE_CODE && action.data['email'] == email);
        expect(verify(mockStore.dispatch(argThat(isValidAction))).callCount, 1);
      });

    });
  }
}

void main() {
  RestoreAccessEmailComponentTests.run();
}
