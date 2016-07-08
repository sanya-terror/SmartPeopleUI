import 'package:test/test.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/index.dart'
    show SharedReducer, SAVE_EMAIL, SIGN_UP_RESEND_CONFIRM_CODE;

class SharedReducerTests {
   static run() {
      group('Shared reducer', () {
         
         var initialState = new State({'some': 'property'});
         
         List<Map<String, dynamic>> cases = [
            {
               'action': new Action(SAVE_EMAIL, { 'email': 'test@test.com'}),
               'result': new State({
                  'some': 'property',
                  'email': 'test@test.com'
               })
            }
         ];

         cases.forEach((testCase) {
            var action = testCase['action'];
            var expected = testCase['result'];

            test('Should apply reducer: ${action.type}', () {
               var actual = SharedReducer.reduce(initialState, action);
               expect(actual, expected);
            });
         });
      });
   }
}

void main() {
   SharedReducerTests.run();
}
