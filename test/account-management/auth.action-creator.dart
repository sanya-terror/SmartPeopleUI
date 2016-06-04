import 'package:test/test.dart';

import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/account-management/index.dart';

class AuthorizationActionCreatorTests {
  static run() {
    group('Authorization action creator', () {
      test('Should return login error action', () {
        var error = "error message";
        Action result = AuthActionCreator.loginError(error);
        expect(result.type, LOGIN_FAILURE);
        expect(result.data, {'message': error});
      });

      test('Should return login request action', () {
        var credentials = {'user': 'TestUser', 'password': 'test123'};
        Action result = AuthActionCreator.requestLogin(credentials);
        expect(result.type, LOGIN_REQUEST);
        expect(result.data, {'credentials': credentials});
      });

      test('Should return login success action', () {
        Action result = AuthActionCreator.receiveLogin();
        expect(result.type, LOGIN_SUCCESS);
        expect(result.data, null);
      });
    });
  }
}

void main() {
  AuthorizationActionCreatorTests.run();
}
