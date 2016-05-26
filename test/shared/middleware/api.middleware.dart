import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';

import 'package:SmartPeopleUI/shared/services/local-storage.interface.dart';
import 'package:SmartPeopleUI/shared/middleware/index.dart';
import 'package:SmartPeopleUI/redux/index.dart';

class MockLocalStorage extends Mock implements ILocalStorageService{
  noSuchMethod(i) => super.noSuchMethod(i);
}

class MockHttpClient extends Mock implements Client{
  noSuchMethod(i) => super.noSuchMethod(i);
}

class MockStore extends Mock implements Store{
  noSuchMethod(i) => super.noSuchMethod(i);
}

get unknownAction => new Action('UNKNOWN');

class ApiMiddlewareTests {
  static run() {
    group('Api middleware', ()
    {
      ILocalStorageService localStorage;
      Client httpClient;
      Store store;
      Dispatcher next = (Action action) => action;

      ApiMiddleware middleware;

      setUp((){
        localStorage = new MockLocalStorage();
        httpClient = new MockHttpClient();
        store = new MockStore();

        middleware = new ApiMiddleware(localStorage, httpClient);
      });

      test('Should call next action if action is not ApiAction', () {
        var result = middleware.apply(store)(next)(unknownAction);
        expect(result, unknownAction);
      });
    });
  }
}

void main() {
  ApiMiddlewareTests.run();
}