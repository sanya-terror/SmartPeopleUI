import 'package:test/test.dart';

import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/index.dart';

class AuthorizationActionCreatorTests {
  static run() {
    group('Authorization action creator', () {
      test('Should return login error action', () {
        var errorCode = 123456;
        Action result = AuthActionCreator.loginError(errorCode);
        expect(result.type, LOGIN_FAILURE);
        expect(result.data, {'errorCode': errorCode});
      });

      test('Should return login request action', () {
        var credentials = {'user': 'TestUser', 'password': 'test123', 'rememberMe': true};
        Action result = AuthActionCreator.requestLogin(credentials);
        expect(result.type, LOGIN_REQUEST);
        expect(result.data, {
          'user': credentials['user'],
          'password': credentials['password'],
          'rememberMe': credentials['rememberMe']
        });
      });

      test('Should return login success action', () {
        Action result = AuthActionCreator.receiveLogin();
        expect(result.type, LOGIN_SUCCESS);
        expect(result.data, null);
      });

      test('Should return login check action', () {
        Action result = AuthActionCreator.checkLogin();
        expect(result.type, LOGIN_CHECK);
        expect(result.data, null);
      });
    });
  }
}

void main() {
  AuthorizationActionCreatorTests.run();
}
