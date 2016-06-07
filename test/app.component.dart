import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'helpers.dart';
import 'dart:async';
import 'package:SmartPeopleUI/index.dart';


class AppComponentTests {
  static run() {
    group('App component', () {

      var mockStore = getMockStore();
      var router = getRouter();

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
