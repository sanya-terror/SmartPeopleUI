import 'package:test/test.dart';

import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/index.dart';

class ApiActionCreatorTests {
  static run() {
    group('Api action', () {
      test('Should throw error if passed non-supported http method', () {
        expect(() => new ApiAction(UNAUTHORIZED_ACTION, '/test', 'UNKNOWN'),
            throwsArgumentError);
      });

      test('Should not throw error if supported http method', () {
        expect(() => new ApiAction(UNAUTHORIZED_ACTION, '/test', 'GET'),
            returnsNormally);
        expect(() => new ApiAction(UNAUTHORIZED_ACTION, '/test', 'POST'),
            returnsNormally);
        expect(() => new ApiAction(UNAUTHORIZED_ACTION, '/test', 'PUT'),
            returnsNormally);
        expect(() => new ApiAction(UNAUTHORIZED_ACTION, '/test', 'DELETE'),
            returnsNormally);
      });
    });
    group('Api action creator', () {
      test('Should return unauthorized error action', () {
        Action result =
            ApiActionCreator.unauthorizedAction(new AuthorizationError());
        expect(result.type, UNAUTHORIZED_ACTION);
        expect(result.data, { 'response': ''});
      });

      test('Should return bad request error action', () {
        Action result = ApiActionCreator
            .badRequestAction(new ApiError(400, 'Some error message!'));
        expect(result.type, BAD_REQUEST_ACTION);
        expect(result.data, {'response': 'Some error message!'});
      });

      test('Should return forbidden error action', () {
        Action result = ApiActionCreator
            .forbiddenAction(new ApiError(400, 'Some error message!'));
        expect(result.type, FORBIDDEN_ACTION);
        expect(result.data, {'response': 'Some error message!'});
      });

      test('Should return not found error action', () {
        Action result = ApiActionCreator
            .notFoundAction(new ApiError(400, 'Some error message!'));
        expect(result.type, NOT_FOUND_ERROR);
        expect(result.data, {'response': 'Some error message!'});
      });

      test('Should return not found error clean action', () {
        Action result = ApiActionCreator.notFoundCleanAction();
        expect(result.type, NOT_FOUND_ERROR_CLEAN);
        expect(result.data, null);
      });

      test('Should return internal server error action', () {
        Action result = ApiActionCreator
            .internalServerErrorAction(new ApiError(400, 'Some error message!'));
        expect(result.type, INTERNAL_SERVER_ERROR_ACTION);
        expect(result.data, {'response': 'Some error message!'});
      });

      test('Should return api action', () {
        ApiAction result = ApiActionCreator
            .apiAction('NEXT_ACTION', '/test', 'POST', {'some': 'data'});
        expect(result.type, 'NEXT_ACTION');
        expect(result.endpoint, '/test');
        expect(result.method, 'POST');
        expect(result.data, {'some': 'data'});
      });

      test('Should return post api action', () {
        ApiAction result = ApiActionCreator
            .postApiAction('NEXT_ACTION', '/test', {'some': 'data'});
        expect(result.type, 'NEXT_ACTION');
        expect(result.endpoint, '/test');
        expect(result.method, 'POST');
        expect(result.data, {'some': 'data'});
      });

      test('Should return get api action', () {
        ApiAction result = ApiActionCreator
            .getApiAction('NEXT_ACTION', '/test', {'some': 'data'});
        expect(result.type, 'NEXT_ACTION');
        expect(result.endpoint, '/test');
        expect(result.method, 'GET');
        expect(result.data, {'some': 'data'});
      });

      test('Should return delete api action', () {
        ApiAction result = ApiActionCreator
            .deleteApiAction('NEXT_ACTION', '/test', {'some': 'data'});
        expect(result.type, 'NEXT_ACTION');
        expect(result.endpoint, '/test');
        expect(result.method, 'DELETE');
        expect(result.data, {'some': 'data'});
      });
      test('Should return put api action', () {
        ApiAction result = ApiActionCreator
            .putApiAction('NEXT_ACTION', '/test', {'some': 'data'});
        expect(result.type, 'NEXT_ACTION');
        expect(result.endpoint, '/test');
        expect(result.method, 'PUT');
        expect(result.data, {'some': 'data'});
      });
    });
  }
}

void main() {
  ApiActionCreatorTests.run();
}
