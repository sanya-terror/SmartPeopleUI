import 'package:test/test.dart';
import 'package:SmartPeopleUI/account-management/index.dart';
import 'package:SmartPeopleUI/redux/index.dart';

class RestoreAccessReducerTests {
  static run() {

    group('Restore access reducer', () {

      State initialState;

      setUp((){
        initialState = new State({ 'someProperty': 'some value' });
      });

      List<Map<String, dynamic>> cases = [
        {
          'action': new Action(GET_RESTORE_CODE, { 'codeSent': true}),
          'result': new State({
            'someProperty': 'some value',
            'restoreAccess': {
              'codeSent': true,
              'userNotFound': null
            }
          })
        },
        {
          'action': new Action(GET_RESTORE_CODE, { 'userNotFound': true}),
          'result': new State({
            'someProperty': 'some value',
            'restoreAccess': {
              'codeSent': null,
              'userNotFound': true
            }
          })
        },
        {
          'action': new Action(APPLY_RESTORE_CODE, { 'codeApplied': true}),
          'result': new State({
            'someProperty': 'some value',
            'restoreAccess': {
              'codeSent': false,
              'userNotFound' : false,
              'codeApplied' : true,
              'invalidCode' : null
            }
          })
        },
        {
          'action': new Action(APPLY_RESTORE_CODE, { 'invalidCode': true}),
          'result': new State({
            'someProperty': 'some value',
            'restoreAccess': {
              'codeSent': false,
              'userNotFound' : false,
              'codeApplied' : null,
              'invalidCode' : true
            }
          })
        },
        {
          'action': new Action(CLEAR_RESTORE_ACCESS),
          'result': new State({
            'someProperty': 'some value',
            'restoreAccess': null
          })
        }
      ];

      cases.forEach((testCase) {
        var action = testCase['action'];
        var expected = testCase['result'];

        test('Should apply reducer: ${action.type}', () {
          var actual = RestoreAccessReducer.reduce(initialState, action);
          expect(actual, expected);
        });
      });
    });
  }
}

void main() {
  RestoreAccessReducerTests.run();
}
