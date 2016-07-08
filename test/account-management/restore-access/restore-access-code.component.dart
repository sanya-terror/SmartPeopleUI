import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:SmartPeopleUI/index.dart';
import '../../helpers/mocks.dart';
import 'package:angular2/common.dart';
import '../../helpers/matchers.dart';

class RestoreAccessCodeComponentTests {
  static run() {
    group('Restore access code component', () {

      var mockStore;
      var code = 'QWERTY12';

      RestoreAccessCodeComponent component;
      setUp((){
        mockStore = getMockStore();
        component = new RestoreAccessCodeComponent(mockStore);
        component.codeControl.updateValue(code);
      });

      test('Should add codeControl to form group', () {
        expect(component.form.controls['code'], component.codeControl);
      });

      test('Should subscribe on state change when apply code', () {

        var subscriptionStream = _mockSubscription(mockStore);

        component.applyCode();

        var onStateChange = verify(subscriptionStream.listen(captureAny)).captured[0];

        var data = new RestoreAccessData()..errorCode = 2222;
        onStateChange(data);

        expect(component.isInvalidCode, true);

        data = new RestoreAccessData()..errorCode = 1111;
        onStateChange(data);

        expect(component.isInvalidCode, false);
      });

      test('Should apply code', () {

        component.applyCode();

        var isValidAction = predicate((action) => action.type == RESTORE_ACCESS_APPLY_CODE && action.data['code'] == code);
        expect(verify(mockStore.dispatch(argThat(isValidAction))).callCount, 1);

      });

      test('Should not apply code and subscribe when form is invalid', () {

        component.form.setErrors({'some_error': 'error'});

        var subscriptionStream = _mockSubscription(mockStore);

        component.applyCode();

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
  RestoreAccessCodeComponentTests.run();
}
