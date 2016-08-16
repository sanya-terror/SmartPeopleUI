import 'dart:convert';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

import 'package:smartpeople_client/shared/index.dart';
import 'package:smartpeople_client/redux/index.dart';

import '../../helpers/mocks.dart';

class MockLocalStorage extends Mock implements LocalStorageService {
  noSuchMethod(i) => super.noSuchMethod(i);
}

class MockSessionStorage extends Mock implements SessionStorageService {
  noSuchMethod(i) => super.noSuchMethod(i);
}

class MockHttpClient extends Mock implements BrowserClient {
  noSuchMethod(i) => super.noSuchMethod(i);
}

get unknownAction => new Action('UNKNOWN', {'test': 'passed'});

class ApiMiddlewareTests {
  static run() {
    group('Api middleware', () {
      LocalStorageService localStorage;
      SessionStorageService sessionStorage;
      BrowserClient httpClient;
      Store store;
      Dispatcher next = (Action action) async => await action;

      ApiMiddleware middleware;

      Map<String, String> _headers = {'Content-Type': 'application/json'};

      setUp(() {
        localStorage = spy(new MockLocalStorage(), new LocalStorageService());
        sessionStorage = spy(new MockSessionStorage(), new SessionStorageService());

        httpClient = spy(new MockHttpClient(), new BrowserClient());
        store = getMockStore();

        middleware = new ApiMiddleware(localStorage, sessionStorage, httpClient);
      });

      group('Non-api actions', () {
        test('Should call next action if action is not ApiAction', () async {
          var result = await middleware.apply(store)(next)(unknownAction);
          expect(result.type, unknownAction.type);
          expect(result.data, unknownAction.data);
        });
      });

      group('Api actions', () {
        var testToken = 'test_token';

        setUp(() {
          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(testToken);
        });

        test('Should return unauthorized action if no token in storages', () async {
          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(null);
          when(sessionStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(null);

          var action = new ApiAction('NEXT', '/test/url', 'POST', {'test': 'passed'});
          var result = await middleware.apply(store)(next)(action);

          expect(result.type, ERROR_UNAUTHORIZED);
        });

        test('Should handle action if no token in storages but checkAuthorization flag is false', () async {
          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(null);
          when(sessionStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(null);

          var action = new ApiAction('NEXT', '/test/url', 'GET', {}, false);
          var url = ApiMiddleware.baseUrl + action.endpoint;
          Response fakeResponse = new Response('{"test": "result"}', 200);
          when(httpClient.get(url, headers: _headers)).thenReturn(fakeResponse);

          var result = await middleware.apply(store)(next)(action);

          expect(result.type, action.type);
          expect(result.data, {'test': 'result'});
        });

        test('Should take token form local storage in prior to session storage', () async {
          var localStorageToken = 'local_storage_token';
          var sessionStorageToken = 'session_storage_token';

          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(localStorageToken);
          when(sessionStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(sessionStorageToken);

          var action = new ApiAction('NEXT', '/test/url', 'GET', {}, false);
          var headers = new Map.from(_headers)..['Authorization'] = localStorageToken;

          await middleware.apply(store)(next)(action);

          verify(httpClient.get(argThat(anything), headers: headers));
        });

        test('Should take token form session storage if no token in local storage', () async {
          var sessionStorageToken = 'session_storage_token';

          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(null);
          when(sessionStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(sessionStorageToken);

          var action = new ApiAction('NEXT', '/test/url', 'GET', {}, false);
          var headers = new Map.from(_headers)..['Authorization'] = sessionStorageToken;

          await middleware.apply(store)(next)(action);

          verify(httpClient.get(argThat(anything), headers: headers));
        });

        test('Should handle http GET request', () async {
          var action = new ApiAction('NEXT', '/test/url', 'GET');
          var url = ApiMiddleware.baseUrl + action.endpoint;
          var headers = new Map.from(_headers)..['Authorization'] = testToken;

          Response fakeResponse = new Response('{"test": "result"}', 200);
          when(httpClient.get(url, headers: headers)).thenReturn(fakeResponse);

          var result = await middleware.apply(store)(next)(action);
          expect(result.type, action.type);
          expect(result.data, {'test': 'result'});
        });

        test('Should handle http DELETE request', () async {
          var action = new ApiAction('NEXT', '/test/url', 'DELETE');
          var url = ApiMiddleware.baseUrl + action.endpoint;
          var headers = new Map.from(_headers)..['Authorization'] = testToken;

          Response fakeResponse = new Response('{"test": "result"}', 200);
          when(httpClient.delete(url, headers: headers)).thenReturn(fakeResponse);

          var result = await middleware.apply(store)(next)(action);
          expect(result.type, action.type);
          expect(result.data, {'test': 'result'});
        });

        test('Should handle http POST request', () async {
          var action = new ApiAction('NEXT', '/test/url', 'POST', {'test': 'passed'});
          var url = ApiMiddleware.baseUrl + action.endpoint;
          var headers = new Map.from(_headers)..['Authorization'] = testToken;

          Response fakeResponse = new Response('{"test": "result"}', 200);
          when(httpClient.post(url, headers: headers, body: JSON.encode(action.data))).thenReturn(fakeResponse);

          var result = await middleware.apply(store)(next)(action);
          expect(result.type, action.type);
          expect(result.data, {'test': 'result'});
        });

        test('Should handle http PUT request', () async {
          var testToken = 'test_token';
          var action = new ApiAction('NEXT', '/test/url', 'PUT', {'test': 'passed'});
          var url = ApiMiddleware.baseUrl + action.endpoint;
          var headers = new Map.from(_headers)..['Authorization'] = testToken;

          Response fakeResponse = new Response('{"test": "result"}', 200);
          when(httpClient.put(url, headers: headers, body: JSON.encode(action.data))).thenReturn(fakeResponse);

          var result = await middleware.apply(store)(next)(action);
          expect(result.type, action.type);
          expect(result.data, {'test': 'result'});
        });

        var errorTestCases = [
          {'statusCode': 400, 'actionType': ERROR_BAD_REQUEST},
          {'statusCode': 401, 'actionType': ERROR_UNAUTHORIZED},
          {'statusCode': 403, 'actionType': ERROR_FORBIDDEN},
          {'statusCode': 404, 'actionType': ERROR_NOT_FOUND},
          {'statusCode': 500, 'actionType': ERROR_INTERNAL_SERVER},
        ];

        errorTestCases.forEach((testCase) {
          test('Should return ${testCase['actionType']}', () async {
            var action = new ApiAction('NEXT', '/test/url', 'GET');
            var testToken = 'test_token';
            var url = ApiMiddleware.baseUrl + action.endpoint;
            var headers = new Map.from(_headers)..['Authorization'] = testToken;

            Response fakeResponse = new Response('Some error message!', testCase['statusCode']);
            when(httpClient.get(url, headers: headers)).thenReturn(fakeResponse);

            var result = await middleware.apply(store)(next)(action);
            expect(result.type, testCase['actionType']);
            expect(result.data['message'], 'Some error message!');
            expect(result.data['stackTrace'], isNotNull);
          });
        });

        test('Should clear storages if unauthorized error', () async {
          var action = new ApiAction('NEXT', '/test/url', 'GET');

          Response fakeResponse = new Response('Some error message!', 401);
          when(httpClient.get(argThat(anything), headers: argThat(anything))).thenReturn(fakeResponse);

          await middleware.apply(store)(next)(action);

          verify(localStorage.remove(ApiMiddleware.TOKEN_KEY));
          verify(sessionStorage.remove(ApiMiddleware.TOKEN_KEY));
        });
      });

      group('Login request action', () {
        var url = ApiMiddleware.baseUrl + '/users/login';
        var data = {'user': 'TestUser', 'password': 'qwerty123', 'rememberMe': true};

        test('Should try to authorize if requested login', () async {
          Response fakeResponse = new Response('{"token": "some_cool_token"}', 200);
          print(url);
          when(httpClient.post(url, headers: _headers, body: JSON.encode(data))).thenReturn(fakeResponse);

          var action = new Action(LOGIN_REQUEST, data);
          var result = await middleware.apply(store)(next)(action);

          expect(result.type, LOGIN_SUCCESS);
          expect(result.data, null);
        });

        test('Should store token to local storage when remeber me option is true', () async {
          data['rememberMe'] = true;

          Response fakeResponse = new Response('{"token": "some_cool_token"}', 200);
          when(httpClient.post(url, headers: _headers, body: JSON.encode(data))).thenReturn(fakeResponse);

          var action = new Action(LOGIN_REQUEST, data);
          await middleware.apply(store)(next)(action);

          verify(localStorage.setItem(ApiMiddleware.TOKEN_KEY, 'some_cool_token'));
          verifyNever(sessionStorage.setItem(argThat(anything), argThat(anything)));
        });

        test('Should store token to session storage when remeber me option is false', () async {
          data['rememberMe'] = false;

          Response fakeResponse = new Response('{"token": "some_cool_token"}', 200);
          when(httpClient.post(url, headers: _headers, body: JSON.encode(data))).thenReturn(fakeResponse);

          var action = new Action(LOGIN_REQUEST, data);
          await middleware.apply(store)(next)(action);

          verifyNever(localStorage.setItem(argThat(anything), argThat(anything)));
          verify(sessionStorage.setItem(ApiMiddleware.TOKEN_KEY, 'some_cool_token'));
        });

        test('Should return login failure if authorization failed', () async {
          Response fakeResponse = new Response('{"errorCode": 7777}', 200);
          when(httpClient.post(url, headers: _headers, body: JSON.encode(data))).thenReturn(fakeResponse);

          var action = new Action(LOGIN_REQUEST, data);
          var result = await middleware.apply(store)(next)(action);
          expect(result.type, LOGIN_FAILURE);
          expect(result.data, {'errorCode': 7777});
        });

        test('Should return api error action if authorization request failed', () async {
          var testToken = 'test_token';

          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(testToken);

          Response fakeResponse = new Response('Some error message!', 400);
          when(httpClient.post(url, headers: _headers, body: JSON.encode(data))).thenReturn(fakeResponse);

          var action = new Action(LOGIN_REQUEST, data);
          var result = await middleware.apply(store)(next)(action);
          expect(result.type, ERROR_BAD_REQUEST);
          expect(result.data['message'], 'Some error message!');
          expect(result.data['stackTrace'], isNotNull);
        });
      });

      group('Login check action', () {
        var action = new Action(LOGIN_CHECK);

        var calls = 0;
        Dispatcher mockNext = (Action action) async {
          calls++;
          return await action;
        };

        setUp(() => calls = 0);

        test('Should not call next if there is no token', () async {
          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(null);
          when(sessionStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(null);

          var result = await middleware.apply(store)(mockNext)(action);

          expect(calls, 0);
          expect(result, {});
        });

        test('Should return login success if there is token in local storage', () async {
          when(sessionStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(null);
          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn('some_key');

          var result = await middleware.apply(store)(mockNext)(action);

          expect(calls, 1);
          expect(result.type, LOGIN_SUCCESS);
          expect(result.data, null);
        });

        test('Should return login success if there is token in session storage', () async {
          when(sessionStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn('some_key');
          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(null);

          var result = await middleware.apply(store)(mockNext)(action);

          expect(calls, 1);
          expect(result.type, LOGIN_SUCCESS);
          expect(result.data, null);
        });
      });
    });
  }
}

void main() {
  ApiMiddlewareTests.run();
}
