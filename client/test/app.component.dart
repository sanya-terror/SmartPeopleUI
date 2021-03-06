import 'dart:html';
import 'package:test/test.dart';

import 'package:mockito/mockito.dart';
import 'package:angular2_testing/angular2_testing.dart';
import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';

import 'helpers/angular.dart' as ng;
import 'helpers/mocks.dart' as mocks;
import 'package:smartpeople_client/index.dart';

class AppComponentTests {
  static run() {
    group('App component view', () {
      ng.initAngularTests();

      ng.setUpProviders(AppComponent);

      AppComponent _component;
      Element _element;
      ComponentFixture _fixture;

      ngSetUp((TestComponentBuilder tcb) async {
        var mockStore = mocks.getMockStore();

        _fixture = await tcb
            .overrideProviders(AppComponent, [provide(InjectableStore, useValue: mockStore)]).createAsync(AppComponent);

        _component = _fixture.componentInstance;
        _element = _fixture.nativeElement;
      });

      ngTest('Should have main, header, drawer and contnent part', () {
        _fixture.detectChanges();
        expect(_element.querySelector('sp-footer'), isNotNull);
        expect(_element.querySelector('div.header'), isNotNull);
        expect(_element.querySelector('sp-drawer'), isNotNull);
        expect(_element.querySelector('div.content'), isNotNull);
      });

      ngTest('Should have all generic error handlers registered', () {
        _fixture.detectChanges();
        expect(_element.querySelector('div.content sp-unauthorized-error'), isNotNull);
        expect(_element.querySelector('div.content sp-unhandled-error'), isNotNull);
        expect(_element.querySelector('div.content sp-forbidden-error'), isNotNull);
      });

      ngTest('Should show login component if not authentificated', () {
        _component.isAuthenticated = false;
        _fixture.detectChanges();
        expect(_element.querySelector('sp-main sp-button.login-button'), isNotNull);
        expect(_element.querySelector('div.user-info'), null);
      });

      ngTest('Should not show login component if authentificated', () {
        _component.isAuthenticated = true;
        _fixture.detectChanges();
        expect(_element.querySelector('sp-login'), null);
        expect(_element.querySelector('sp-main div.user-info'), isNotNull);
      });
    });
    group('App component', () {
      var mockStore = mocks.getMockStore();
      Router mockRouter = mocks.getRouter();

      AppComponent component;
      setUp(() {
        component = new AppComponent(mockStore, mockRouter);
      });

      test('Should check login during initialization', () {
        component.ngOnInit();

        expect(verify(mockStore.listen(argThat(anything))).callCount, 1);
        expect(verify(mockStore.dispatch(argThat(predicate((action) => action.type == LOGIN_CHECK)))).callCount, 1);
      });

      test('Should react on state change', () {
        component.ngOnInit();

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
      });

      test('Should navigate to not found page is not found state', () {
        component.ngOnInit();

        var onStateChange = verify(mockStore.listen(captureAny)).captured[0];

        var newState = new State({'isResourceNotFoundError': false});

        onStateChange(newState);
        verifyNever(mockRouter.navigate(['NotFoundPage']));

        newState['isResourceNotFoundError'] = true;
        onStateChange(newState);
        verify(mockRouter.navigate(['NotFoundPage']));
      });
    });
  }
}

void main() {
  AppComponentTests.run();
}
