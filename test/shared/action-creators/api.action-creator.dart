import 'package:test/test.dart';

import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/index.dart';

class ApiActionCreatorTests {
  static run() {
    group('Api action', () {
      test('Should throw error if passed non-supported http method', () {
        expect(() => new ApiAction(ERROR_UNAUTHORIZED, '/test', 'UNKNOWN'),
            throwsArgumentError);
      });

      test('Should not throw error if supported http method', () {
        expect(() => new ApiAction(ERROR_UNAUTHORIZED, '/test', 'GET'),
            returnsNormally);
        expect(() => new ApiAction(ERROR_UNAUTHORIZED, '/test', 'POST'),
            returnsNormally);
        expect(() => new ApiAction(ERROR_UNAUTHORIZED, '/test', 'PUT'),
            returnsNormally);
        expect(() => new ApiAction(ERROR_UNAUTHORIZED, '/test', 'DELETE'),
            returnsNormally);
      });
    });
    group('Api action creator', () {
      group('Errors', () {

        test('Should return unauthorized error action', () {
          Action result = ApiActionCreator.unauthorizedAction(new AuthorizationError());
          expect(result.type, ERROR_UNAUTHORIZED);
          expect(result.data['message'], '');
          expect(result.data.containsKey('stackTrace'), isTrue);
        });

        test('Should return unauthorized error clean action', () {
          Action result = ApiActionCreator.unauthorizedCleanAction();
          expect(result.type, ERROR_REMOVE_UNAUTHORIZED);
          expect(result.data, null);
        });

        test('Should return bad request error action', () {
          Action result = ApiActionCreator
          .badRequestAction(new ApiError(400, 'Some error message!'));
          expect(result.type, ERROR_BAD_REQUEST);
          expect(result.data['message'], 'Some error message!');
          expect(result.data.containsKey('stackTrace'), isTrue);
        });

        test('Should return bad request error clean action', () {
          Action result = ApiActionCreator.badRequestErrorCleanAction();
          expect(result.type, ERROR_REMOVE_BAD_REQUEST);
          expect(result.data, null);
        });

        test('Should return forbidden error action', () {
          Action result = ApiActionCreator
          .forbiddenAction(new ApiError(403, 'Some error message!'));
          expect(result.type, ERROR_FORBIDDEN);
          expect(result.data['message'], 'Some error message!');
          expect(result.data.containsKey('stackTrace'), isTrue);
        });

        test('Should return not found error action', () {
          Action result = ApiActionCreator
          .notFoundAction(new ApiError(404, 'Some error message!'));
          expect(result.type, ERROR_NOT_FOUND);
          expect(result.data['message'], 'Some error message!');
          expect(result.data.containsKey('stackTrace'), isTrue);
        });

        test('Should return not found error clean action', () {
          Action result = ApiActionCreator.notFoundCleanAction();
          expect(result.type, ERROR_REMOVE_NOT_FOUND);
          expect(result.data, null);
        });

        test('Should return internal server error action', () {
          Action result = ApiActionCreator
          .internalServerErrorAction(new ApiError(500, 'Some error message!'));
          expect(result.type, ERROR_INTERNAL_SERVER);
          expect(result.data['message'], 'Some error message!');
          expect(result.data.containsKey('stackTrace'), isTrue);
        });

        test('Should return bad request error clean action', () {
          Action result = ApiActionCreator.internalServerErrorCleanAction();
          expect(result.type, ERROR_REMOVE_INTERNAL_SERVER);
          expect(result.data, null);
        });
      });

      group('API', () {
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
    });
  }
}

void main() {
  ApiActionCreatorTests.run();
}
