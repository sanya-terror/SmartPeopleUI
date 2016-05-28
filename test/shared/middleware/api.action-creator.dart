import 'package:test/test.dart';

import 'package:SmartPeopleUI/shared/middleware/index.dart';
import 'package:SmartPeopleUI/redux/index.dart';

class ApiActionCreatorTests {
  static run() {
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
        ApiAction result = ApiActionCreator.apiAction('NEXT_ACTION', '/test', {'some': 'data'});
        expect(result.type, 'NEXT_ACTION');
        expect(result.endpoint, '/test');
        expect(result.data, {'some': 'data'});
      });
    });
  }
}

void main() {
  ApiActionCreatorTests.run();
}