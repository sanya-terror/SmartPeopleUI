import 'dart:html';

import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'helpers.dart' as helper;
import 'package:SmartPeopleUI/index.dart';
import 'shared/packages/angular2_testing/angular2_testing.dart';
import 'package:angular2/router.dart' as router;
import 'package:angular2/core.dart';
import 'package:angular2/src/router/router.dart';

class AppComponentTests {
  static run() {
    group('App component view', () {

      helper.initAngularTests();

      // Initialize the injection tokens you will use in your tests.
      setUpProviders(() {
        return [
          router.RouteRegistry,
          provide(router.Location, useClass: helper.MockLocation),
          provide(router.ROUTER_PRIMARY_COMPONENT, useValue: AppComponent),
          provide(router.Router, useClass: RootRouter),
          TestComponentBuilder,
          LocalStorageService,
          InjectableStore
        ];
      });

      ngTest('Should not show login component if authentificated', (TestComponentBuilder tcb)  async {
        var fixture  = await tcb.createAsync(AppComponent);
        AppComponent component = fixture.componentInstance;
        Element element = fixture.nativeElement;
        component.isAuthenticated = true;
        fixture.detectChanges();
        expect(element.querySelector('sp-login'), null);
      });
    });
    group('App component', () {

      var mockStore = helper.getMockStore();
      var router = helper.getRouter();

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
