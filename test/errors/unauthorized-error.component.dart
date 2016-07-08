import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import '../helpers/mocks.dart' as mocks;

import 'package:SmartPeopleUI/index.dart';

class UnauthorizedErrorTests {
   static run() {
      group('Unauthorized error component', () {

         var mockStore = mocks.getMockStore();

         UnauthorizedErrorComponent component;
         setUp((){
            when(mockStore.dispatch(argThat(anything))).thenReturn({});
            component = new UnauthorizedErrorComponent(mockStore);
         });

         test('Should clean error from state on destroy', () {
            component.ngOnDestroy();
            expect(verify(mockStore.dispatch(argThat(predicate((action) => action.type == ERROR_REMOVE_UNAUTHORIZED)))).callCount, 1);
         });
      });
   }
}

void main() {
   UnauthorizedErrorTests.run();
}
