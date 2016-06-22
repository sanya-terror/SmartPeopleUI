import 'dart:html';

import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:angular2_testing/angular2_testing.dart';

import 'package:SmartPeopleUI/index.dart';
import '../../helpers/angular.dart' as ng;
import '../../helpers/mocks.dart';

class RestoreAccessComponentTests {
  static run() {
    group('Restore access component view', () {

      ng.initAngularTests();

      ng.setUpProviders(RestoreAccessComponent);

      RestoreAccessComponent _component;
      Element _element;
      ComponentFixture _fixture;

      ngSetUp((TestComponentBuilder tcb) async{
        _fixture  = await tcb.createAsync(RestoreAccessComponent);
        _component = _fixture.componentInstance;
        _element = _fixture.nativeElement;
      });

      var testCases = [
        {
          'state': { 'isCodeSent': true, 'isCodeApplied': true },
          'resultSelectors': {'code': isNull, 'email': isNull, 'password': isNotNull }
        },
        {
          'state': { 'isCodeSent': true, 'isCodeApplied': false },
          'resultSelectors': {'code': isNotNull, 'email': isNull, 'password': isNull }
        },
        {
          'state': { 'isCodeSent': false, 'isCodeApplied': true },
          'resultSelectors': {'code': isNull, 'email': isNull, 'password': isNotNull }
        },
        {
          'state': { 'isCodeSent': false, 'isCodeApplied': false },
          'resultSelectors': {'code': isNull, 'email': isNotNull, 'password': isNull }
        },
      ];

      testCases.forEach((testCase){
        var state = testCase['state'];
        var resultSelectors = testCase['resultSelectors'];

        ngTest('Should apply correct view state. State: $state', ()  {

          _component.isCodeSent = state['isCodeSent'];
          _component.isCodeApplied = state['isCodeApplied'];

          _fixture.detectChanges();

          expect(_element.querySelector('sp-info sp-restore-access-email'), resultSelectors['email']);
          expect(_element.querySelector('sp-info sp-restore-access-code'), resultSelectors['code']);
          expect(_element.querySelector('sp-info sp-change-password'), resultSelectors['password']);
        });
      });
    });

    group('Restore access component', () {

      var mockStore;

      RestoreAccessComponent component;
      setUp((){
        mockStore = getMockStore();
        when(mockStore.dispatch(argThat(anything))).thenReturn({});
        component = new RestoreAccessComponent(mockStore);
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

          expect(component.isCodeSent, false);
        });

        test('Should change component state base on restoreAccess object in new state', () {

          var newState = new State({'restoreAccess': new RestoreAccessData(isCodeSent: true)});
          onStateChange(newState);

          expect(component.isCodeSent, true);
        });
      });

      test('Should set default on destroy component', () {
        component.ngOnDestroy();
        expect(verify(mockStore.dispatch(argThat(predicate((action) => action.type == CLEAR_RESTORE_ACCESS)))).callCount, 1);
      });

      test('Should set default', () {
        component.setDefault();
        expect(verify(mockStore.dispatch(argThat(predicate((action) => action.type == CLEAR_RESTORE_ACCESS)))).callCount, 1);
      });
    });
  }
}

void main() {
  RestoreAccessComponentTests.run();
}
