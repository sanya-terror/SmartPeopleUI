import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/account-management/sign-up/index.dart';

class SignUpData {
   String password;
   String signUpToken;
   int errorCode;

   SignUpData();

   SignUpData.from(SignUpData data) {
      this.password = data?.password;
      this.signUpToken = data?.signUpToken;
      this.errorCode = data?.errorCode;
   }

   toString(){
      return '{ password: $password, signUpToken: $signUpToken, errorCode: $errorCode }';
   }
}

class SignUpReducer {
   static State reduce(State state, Action action) {

      switch (action.type) {

         case SAVE_SIGN_UP_PASSWORD:
            var data = new SignUpData.from(state['signUp'])
               ..password = action.data['password'];
            return new State.from(state)
               ..['signUp'] = data;

         case SEND_SIGN_UP_FORM:
            var data = new SignUpData.from(state['signUp'])
               ..signUpToken = action.data['token']
               ..errorCode = action.data['errorCode'];
            return new State.from(state)
               ..['signUp'] = data;

         case APPLY_SIGN_UP_CONFIRMATION_CODE:
            var data = new SignUpData.from(state['signUp'])
               ..errorCode = action.data['errorCode'];
            return new State.from(state)
               ..['signUp'] = data;

         case CLEAR_SIGN_UP:
            return new State.from(state)
               ..['signUp'] = null;

         default:
            return state;
      }
   }
}
