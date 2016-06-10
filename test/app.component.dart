import 'dart:html';

import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'helpers/angular.dart' as ng;
import 'helpers/mocks.dart' as mocks;
import 'package:SmartPeopleUI/index.dart';
import 'shared/packages/angular2_testing/angular2_testing.dart';

class AppComponentTests {
  static run() {
    group('App component view', () {

      ng.initAngularTests();

      ng.setUpProviders(AppComponent, [
        LocalStorageService,
        InjectableStore
      ]);

      AppComponent _component;
      Element _element;
      ComponentFixture _fixture;

      ngSetUp((TestComponentBuilder tcb) async{
        _fixture  = await tcb.createAsync(AppComponent);
        _component = _fixture.componentInstance;
        _element = _fixture.nativeElement;
      });

      ngTest('Should have header, footer and contnent part', () {
        _fixture.detectChanges();
        expect(_element.querySelector('sp-footer'), isNotNull);
        expect(_element.querySelector('sp-header'), isNotNull);
        expect(_element.querySelector('div.content'), isNotNull);
      });

      ngTest('Should show login component if not authentificated', ()  {
        _component.isAuthenticated = false;
        _fixture.detectChanges();
        expect(_element.querySelector('sp-header sp-login'), isNotNull);
        expect(_element.querySelector('div.user-info'), null);
      });

      ngTest('Should not show login component if authentificated', () {
        _component.isAuthenticated = true;
        _fixture.detectChanges();
        expect(_element.querySelector('sp-login'), null);
        expect(_element.querySelector('sp-header div.user-info'), isNotNull);
      });
    });
    group('App component', () {

      var mockStore = mocks.getMockStore();
      var router = mocks.getRouter();

      AppComponent component;
      setUp((){
        when(mockStore.dispatch(argThat(anything))).thenReturn({});
        component =new AppComponent(mockStore, router);
      });

      test('Should check login during initialization', () {

        component.ngOnInit();

        expect(verify(mockStore.listen(argThat(anything))).callCount, 1);
        expect(verify(mockStore.dispatch(argThat(predicate((action) => action.type == LOGIN_CHECK)))).callCount, 1);
      });

      test('Should react on state change', () {

        component.ngOnInit();

          when(router.navigate(argThat(contains('ChangePassword')))).thenReturn({});

        var onStateChange = verify(mockStore.listen(captureAny)).captured[0];

        expect(component.isAuthenticated, isFalse);

        var newState = new State({'isAuthenticated': false});

        onStateChange(newState);
        expect(component.isAuthenticated, isFalse);

        newState['isAuthenticated'] = true;
        onStateChange(newState);
        expect(component.isAuthenticated, isTrue);

        newState['isAuthenticated'] = false;
        onStateChange(newState);
        expect(component.isAuthenticated, isFalse);

        expect(verify(router.navigate(argThat(contains('ChangePassword')))).callCount, 2);
      });
    });
  }
}

void main() {
  AppComponentTests.run();
}
