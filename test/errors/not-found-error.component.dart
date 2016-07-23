import 'dart:mirrors';

import 'package:test/test.dart';
@MirrorsUsed()
import 'package:mockito/mockito.dart';

import '../helpers/mocks.dart' as mocks;

import 'package:SmartPeopleUI/index.dart';

class NotFoundErrorTests {
   static run() {
      group('Not found error component', () {

         var mockStore = mocks.getMockStore();

         NotFoundErrorComponent component;
         setUp((){
            component = new NotFoundErrorComponent(mockStore);
         });

         test('Should clean error from state on destroy', () {
            component.ngOnDestroy();
            expect(verify(mockStore.dispatch(argThat(predicate((action) => action.type == ERROR_REMOVE_NOT_FOUND)))).callCount, 1);
         });
      });
   }
}

void main() {
   NotFoundErrorTests.run();
}
