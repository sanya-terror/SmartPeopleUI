import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';

import 'package:SmartPeopleUI/shared/services/local-storage.interface.dart';
import 'package:SmartPeopleUI/shared/middleware/index.dart';
import 'package:SmartPeopleUI/redux/index.dart';

class FakeLocalStorageService implements ILocalStorageService{
  String getItem(String keyName) => '';
  void setItem(String key, String value) {}
  void clear(){}
  bool containsKey(String key) => false;
}

class MockLocalStorage extends Mock implements ILocalStorageService{
  noSuchMethod(i) => super.noSuchMethod(i);
}

class MockHttpClient extends Mock implements Client{
  noSuchMethod(i) => super.noSuchMethod(i);
}

class MockStore extends Mock implements Store{
  noSuchMethod(i) => super.noSuchMethod(i);
}

get unknownAction => new Action('UNKNOWN', { 'test': 'passed'});
get apiAction => new ApiAction('NEXT', '/test/url', { 'test': 'passed'} );

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
        localStorage = spy(new MockLocalStorage(), new FakeLocalStorageService());
        httpClient = spy(new MockHttpClient(), new Client());
        store = new MockStore();

        middleware = new ApiMiddleware(localStorage, httpClient);
      });

      test('Should call next action if action is not ApiAction', () async {
        var result = await middleware.apply(store)(next)(unknownAction);
        expect(result.type, unknownAction.type);
        expect(result.data, unknownAction.data);
      });

      test('Should return unauthorized action if no token in local storage', () async {

        when(localStorage.getItem('id_token')).thenReturn(null);

        var result = await middleware.apply(store)(next)(apiAction);
        expect(result.type, UNAUTHORIZED_ACTION);
      });

      test('Should return current action with data received from http client', () async {

        var testToken = 'test_token';
        var url = ApiMiddleware.BASE_URL + apiAction.endpoint;

        when(localStorage.getItem('id_token')).thenReturn(testToken);

        Response fakeResponse = new Response('{"test": "result"}', 200);
        when(httpClient
        .get(url, headers: { 'Authorization': testToken}))
        .thenReturn(fakeResponse);

        var result = await middleware.apply(store)(next)(apiAction);
        expect(result.type, apiAction.type);
        expect(result.data, {'test': 'result'});
      });

      test('Should return api error action', () async {

        var testToken = 'test_token';
        var url = ApiMiddleware.BASE_URL + apiAction.endpoint;

        when(localStorage.getItem('id_token')).thenReturn(testToken);

        Response fakeResponse = new Response('{"error": "message"}', 400);
        when(httpClient
        .get(url, headers: { 'Authorization': testToken}))
        .thenReturn(fakeResponse);

        var result = await middleware.apply(store)(next)(apiAction);
        expect(result.type, API_ERROR_ACTION);
        expect(result.data, null);
      });
    });
  }
}

void main() {
  ApiMiddlewareTests.run();
}