import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:SmartPeopleUI/index.dart';
import '../../helpers/mocks.dart';
import 'package:angular2/common.dart';

class RestoreAccessCodeComponentTests {
  static run() {
    group('Restore access code component', () {

      var mockStore;

      RestoreAccessCodeComponent component;
      setUp((){
        mockStore = getMockStore();
        when(mockStore.dispatch(argThat(anything))).thenReturn({});
        component = new RestoreAccessCodeComponent(mockStore);
      });

      test('Should add codeControl to form group', () {
        expect(component.form.controls['code'], component.codeControl);
      });

      test('Should apply code', () {

        var code = 'QWERTY123';
        component.codeControl = new Control(code);
        component.applyCode();

        var isValidAction = predicate((action) => action.type == APPLY_RESTORE_CODE && action.data['code'] == code);
        expect(verify(mockStore.dispatch(argThat(isValidAction))).callCount, 1);
      });
    });
  }
}

void main() {
  RestoreAccessCodeComponentTests.run();
}
