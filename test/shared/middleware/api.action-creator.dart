import 'package:test/test.dart';

import 'package:SmartPeopleUI/shared/middleware/index.dart';
import 'package:SmartPeopleUI/redux/index.dart';

class ApiActionCreatorTests {
  static run() {
    group('Api action', () {
      test('Should throw error if passed non-supported http method', () {
        expect(() => new ApiAction(UNAUTHORIZED_ACTION, '/test', 'UNKNOWN'), throwsArgumentError);
      });

      test('Should not throw error if supported http method', () {
        expect(() => new ApiAction(UNAUTHORIZED_ACTION, '/test', 'GET'), returnsNormally);
        expect(() => new ApiAction(UNAUTHORIZED_ACTION, '/test', 'POST'), returnsNormally);
        expect(() => new ApiAction(UNAUTHORIZED_ACTION, '/test', 'PUT'), returnsNormally);
        expect(() => new ApiAction(UNAUTHORIZED_ACTION, '/test', 'DELETE'), returnsNormally);
      });
    });
    group('Api action creator', ()
    {
      test('Should return unauthorized error action', (){
        Action result = ApiActionCreator.unauthorizedAction();
        expect(result.type, UNAUTHORIZED_ACTION);
        expect(result.data, null);
      });

      test('Should return api error action', (){
        Action result = ApiActionCreator.apiErrorAction();
        expect(result.type, API_ERROR_ACTION);
        expect(result.data, null);
      });

      test('Should return api action', (){
        ApiAction result = ApiActionCreator.apiAction('NEXT_ACTION', '/test', 'POST', {'some': 'data'});
        expect(result.type, 'NEXT_ACTION');
        expect(result.endpoint, '/test');
        expect(result.method, 'POST');
        expect(result.data, {'some': 'data'});
      });

      test('Should return post api action', (){
        ApiAction result = ApiActionCreator.postApiAction('NEXT_ACTION', '/test', {'some': 'data'});
        expect(result.type, 'NEXT_ACTION');
        expect(result.endpoint, '/test');
        expect(result.method, 'POST');
        expect(result.data, {'some': 'data'});
      });

      test('Should return get api action', (){
        ApiAction result = ApiActionCreator.getApiAction('NEXT_ACTION', '/test', {'some': 'data'});
        expect(result.type, 'NEXT_ACTION');
        expect(result.endpoint, '/test');
        expect(result.method, 'GET');
        expect(result.data, {'some': 'data'});
      });

      test('Should return delete api action', (){
        ApiAction result = ApiActionCreator.deleteApiAction('NEXT_ACTION', '/test', {'some': 'data'});
        expect(result.type, 'NEXT_ACTION');
        expect(result.endpoint, '/test');
        expect(result.method, 'DELETE');
        expect(result.data, {'some': 'data'});
      });
      test('Should return put api action', (){
        ApiAction result = ApiActionCreator.putApiAction('NEXT_ACTION', '/test', {'some': 'data'});
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