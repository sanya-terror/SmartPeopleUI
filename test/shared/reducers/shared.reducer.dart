import 'package:test/test.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/index.dart'
    show SharedReducer, SAVE_EMAIL, RESEND_CONFIRM_CODE;

class SharedReducerTests {
   static run() {
      group('Shared reducer', () {
         List<Map<String, dynamic>> cases = [
            {
               'action': new Action(SAVE_EMAIL, { 'email': 'test@test.com'}),
               'result': new State({
                  'email': 'test@test.com'
               })
            }
         ];

         cases.forEach((testCase) {
            var action = testCase['action'];
            var expected = testCase['result'];

            test('Should apply reducer: ${action.type}', () {
               var actual = SharedReducer.reduce(State.emptyState, action);
               expect(actual, expected);
            });
         });
      });
   }
}

void main() {
   SharedReducerTests.run();
}
