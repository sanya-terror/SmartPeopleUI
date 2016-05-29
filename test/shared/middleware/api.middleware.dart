import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/browser_client.dart';

import 'package:SmartPeopleUI/shared/services/local-storage.service.dart';
import 'package:SmartPeopleUI/shared/middleware/index.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/authorization/authorization.action-creator.dart';
import 'package:http/http.dart';

class MockLocalStorage extends Mock implements LocalStorageService{
  noSuchMethod(i) => super.noSuchMethod(i);
}

class MockHttpClient extends Mock implements BrowserClient{
  noSuchMethod(i) => super.noSuchMethod(i);
}

class MockStore extends Mock implements Store{
  noSuchMethod(i) => super.noSuchMethod(i);
}

get unknownAction => new Action('UNKNOWN', { 'test': 'passed'});

class ApiMiddlewareTests {
  static run() {
    group('Api middleware', ()
    {
      LocalStorageService localStorage;
      BrowserClient httpClient;
      Store store;
      Dispatcher next = (Action action) async => await action;

      ApiMiddleware middleware;

      setUp((){
        localStorage = spy(new MockLocalStorage(), new LocalStorageService());
        httpClient = spy(new MockHttpClient(), new BrowserClient());
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

        var action = new ApiAction('NEXT', '/test/url', 'POST', { 'test': 'passed'} );
        var result = await middleware.apply(store)(next)(action);
        expect(result.type, UNAUTHORIZED_ACTION);
      });

      test('Should handle http GET request', () async {

        var testToken = 'test_token';
        var action = new ApiAction('NEXT', '/test/url', 'GET');
        var url = ApiMiddleware.BASE_URL + action.endpoint;

        when(localStorage.getItem('id_token')).thenReturn(testToken);

        Response fakeResponse = new Response('{"test": "result"}', 200);
        when(httpClient
        .get(url, headers: { 'Authorization': testToken}))
        .thenReturn(fakeResponse);

        var result = await middleware.apply(store)(next)(action);
        expect(result.type, action.type);
        expect(result.data, {'test': 'result'});
      });

      test('Should handle http DELETE request', () async {

        var testToken = 'test_token';
        var action = new ApiAction('NEXT', '/test/url', 'DELETE');
        var url = ApiMiddleware.BASE_URL + action.endpoint;

        when(localStorage.getItem('id_token')).thenReturn(testToken);

        Response fakeResponse = new Response('{"test": "result"}', 200);
        when(httpClient
        .delete(url, headers: { 'Authorization': testToken}))
        .thenReturn(fakeResponse);

        var result = await middleware.apply(store)(next)(action);
        expect(result.type, action.type);
        expect(result.data, {'test': 'result'});
      });

      test('Should handle http POST request', () async {

        var testToken = 'test_token';
        var action = new ApiAction('NEXT', '/test/url', 'POST', { 'test': 'passed'});
        var url = ApiMiddleware.BASE_URL + action.endpoint;

        when(localStorage.getItem('id_token')).thenReturn(testToken);

        Response fakeResponse = new Response('{"test": "result"}', 200);
        when(httpClient
        .post(url, headers: { 'Authorization': testToken}, body: action.data))
        .thenReturn(fakeResponse);

        var result = await middleware.apply(store)(next)(action);
        expect(result.type, action.type);
        expect(result.data, {'test': 'result'});
      });

      test('Should handle http PUT request', () async {

        var testToken = 'test_token';
        var action = new ApiAction('NEXT', '/test/url', 'PUT', { 'test': 'passed'});
        var url = ApiMiddleware.BASE_URL + action.endpoint;

        when(localStorage.getItem('id_token')).thenReturn(testToken);

        Response fakeResponse = new Response('{"test": "result"}', 200);
        when(httpClient
        .put(url, headers: { 'Authorization': testToken}, body: action.data))
        .thenReturn(fakeResponse);

        var result = await middleware.apply(store)(next)(action);
        expect(result.type, action.type);
        expect(result.data, {'test': 'result'});
      });

      test('Should return api error action', () async {

        var action = new ApiAction('NEXT', '/test/url', 'POST', { 'test': 'passed'});
        var testToken = 'test_token';
        var url = ApiMiddleware.BASE_URL + action.endpoint;

        when(localStorage.getItem('id_token')).thenReturn(testToken);

        Response fakeResponse = new Response('{"error": "message"}', 400);
        when(httpClient
        .post(url, headers: { 'Authorization': testToken}))
        .thenReturn(fakeResponse);

        var result = await middleware.apply(store)(next)(action);
        expect(result.type, API_ERROR_ACTION);
        expect(result.data, null);
      });

      test('Should try to authorize if requested login', () async {

        var url = ApiMiddleware.BASE_URL + '/authorize';
        var data = {'user': 'TestUser', 'password': 'qwerty123'};

        Response fakeResponse = new Response('{"token": "some_cool_token"}', 200);
        when(httpClient.post(url, headers: {}, body: data))
        .thenReturn(fakeResponse);

        var action = new Action(LOGIN_REQUEST, data);
        var result = await middleware.apply(store)(next)(action);
        expect(result.type, LOGIN_SUCCESS);
        expect(result.data, {'token': 'some_cool_token'});
      });

      test('Should return login failure if authorization failed', () async {

        var url = ApiMiddleware.BASE_URL + '/authorize';
        var data = {'user': 'TestUser', 'password': 'qwerty123'};

        Response fakeResponse = new Response('{"error": "Some error message!"}', 200);
        when(httpClient.post(url, headers: {}, body: data))
        .thenReturn(fakeResponse);

        var action = new Action(LOGIN_REQUEST, data);
        var result = await middleware.apply(store)(next)(action);
        expect(result.type, LOGIN_FAILURE);
        expect(result.data, {'message': 'Some error message!'});
      });

      test('Should return api error action if authorization request failed', () async {

        var testToken = 'test_token';
        var url = ApiMiddleware.BASE_URL + '/authorize';
        var data = {'user': 'TestUser', 'password': 'qwerty123'};

        when(localStorage.getItem('id_token')).thenReturn(testToken);

        Response fakeResponse = new Response('{"error": "message"}', 400);
        when(httpClient
        .post(url, headers: { 'Authorization': testToken}))
        .thenReturn(fakeResponse);

        var action = new Action(LOGIN_REQUEST, data);
        var result = await middleware.apply(store)(next)(action);
        expect(result.type, API_ERROR_ACTION);
        expect(result.data, null);
      });
    });
  }
}

void main() {
  ApiMiddlewareTests.run();
}