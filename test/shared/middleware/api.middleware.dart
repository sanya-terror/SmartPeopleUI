import 'dart:convert';

import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

import 'package:SmartPeopleUI/shared/index.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/account-management/auth.action-creator.dart';

import '../../helpers/mocks.dart';

class MockLocalStorage extends Mock implements LocalStorageService {
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
      BrowserClient httpClient;
      Store store;
      Dispatcher next = (Action action) async => await action;

      ApiMiddleware middleware;

      Map<String, String> _headers = {'Content-Type': 'application/json'};

      setUp(() {
        localStorage = spy(new MockLocalStorage(), new LocalStorageService());
        httpClient = spy(new MockHttpClient(), new BrowserClient());
        store = getMockStore();

        middleware = new ApiMiddleware(localStorage, httpClient);
      });

      group('Non-api actions', () {
        test('Should call next action if action is not ApiAction', () async {
          var result = await middleware.apply(store)(next)(unknownAction);
          expect(result.type, unknownAction.type);
          expect(result.data, unknownAction.data);
        });
      });

      group('Api actions', () {
        test('Should return unauthorized action if no token in local storage', () async {
          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(null);

          var action = new ApiAction('NEXT', '/test/url', 'POST', {'test': 'passed'});
          var result = await middleware.apply(store)(next)(action);
          expect(result.type, UNAUTHORIZED_ACTION);
        });

        test('Should handle action if no token in local storage but checkAuthorization flag is false', () async {
          var action = new ApiAction('NEXT', '/test/url', 'GET', {}, false);
          var url = ApiMiddleware.BASE_URL + action.endpoint;

          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(null);

          Response fakeResponse = new Response('{"test": "result"}', 200);
          when(httpClient.get(url, headers: _headers)).thenReturn(fakeResponse);

          var result = await middleware.apply(store)(next)(action);
          expect(result.type, action.type);
          expect(result.data, {'test': 'result'});
        });

        test('Should handle http GET request', () async {
          var testToken = 'test_token';
          var action = new ApiAction('NEXT', '/test/url', 'GET');
          var url = ApiMiddleware.BASE_URL + action.endpoint;
          var headers = new Map.from(_headers)
            ..['Authorization'] = testToken;

          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(testToken);

          Response fakeResponse = new Response('{"test": "result"}', 200);
          when(httpClient.get(url, headers: headers)).thenReturn(fakeResponse);

          var result = await middleware.apply(store)(next)(action);
          expect(result.type, action.type);
          expect(result.data, {'test': 'result'});
        });

        test('Should handle http DELETE request', () async {
          var testToken = 'test_token';
          var action = new ApiAction('NEXT', '/test/url', 'DELETE');
          var url = ApiMiddleware.BASE_URL + action.endpoint;
          var headers = new Map.from(_headers)
            ..['Authorization'] = testToken;

          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(testToken);

          Response fakeResponse = new Response('{"test": "result"}', 200);
          when(httpClient.delete(url, headers: headers)).thenReturn(fakeResponse);

          var result = await middleware.apply(store)(next)(action);
          expect(result.type, action.type);
          expect(result.data, {'test': 'result'});
        });

        test('Should handle http POST request', () async {
          var testToken = 'test_token';
          var action = new ApiAction('NEXT', '/test/url', 'POST', {'test': 'passed'});
          var url = ApiMiddleware.BASE_URL + action.endpoint;
          var headers = new Map.from(_headers)
            ..['Authorization'] = testToken;

          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(testToken);

          Response fakeResponse = new Response('{"test": "result"}', 200);
          when(httpClient.post(url, headers: headers, body: JSON.encode(action.data))).thenReturn(fakeResponse);

          var result = await middleware.apply(store)(next)(action);
          expect(result.type, action.type);
          expect(result.data, {'test': 'result'});
        });

        test('Should handle http PUT request', () async {
          var testToken = 'test_token';
          var action = new ApiAction('NEXT', '/test/url', 'PUT', {'test': 'passed'});
          var url = ApiMiddleware.BASE_URL + action.endpoint;
          var headers = new Map.from(_headers)
            ..['Authorization'] = testToken;

          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(testToken);

          Response fakeResponse = new Response('{"test": "result"}', 200);
          when(httpClient.put(url, headers: headers, body: JSON.encode(action.data))).thenReturn(fakeResponse);

          var result = await middleware.apply(store)(next)(action);
          expect(result.type, action.type);
          expect(result.data, {'test': 'result'});
        });

        var errorTestCases = [
          {'statusCode': 400, 'actionType': BAD_REQUEST_ACTION},
          {'statusCode': 401, 'actionType': UNAUTHORIZED_ACTION},
          {'statusCode': 403, 'actionType': FORBIDDEN_ACTION},
          {'statusCode': 404, 'actionType': NOT_FOUND_ACTION},
          {'statusCode': 500, 'actionType': INTERNAL_SERVER_ERROR_ACTION},
        ];

        errorTestCases.forEach((testCase) {
          test('Should return ${testCase['actionType']}', () async {
            var action = new ApiAction('NEXT', '/test/url', 'GET');
            var testToken = 'test_token';
            var url = ApiMiddleware.BASE_URL + action.endpoint;
            var headers = new Map.from(_headers)
              ..['Authorization'] = testToken;

            when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(testToken);

            Response fakeResponse = new Response('Some error message!', testCase['statusCode']);
            when(httpClient.get(url, headers: headers)).thenReturn(fakeResponse);

            var result = await middleware.apply(store)(next)(action);
            expect(result.type, testCase['actionType']);
            expect(result.data, {'response': 'Some error message!'});
          });
        });
      });

      group('Login request action', () {

        var url = ApiMiddleware.BASE_URL + '/authorize';
        var data = {'user': 'TestUser', 'password': 'qwerty123'};

        test('Should try to authorize if requested login', () async {

          Response fakeResponse = new Response('{"token": "some_cool_token"}', 200);
          when(httpClient.post(url, headers: _headers, body: JSON.encode(data))).thenReturn(fakeResponse);

          var action = new Action(LOGIN_REQUEST, data);
          var result = await middleware.apply(store)(next)(action);

          verify(localStorage.setItem(ApiMiddleware.TOKEN_KEY, 'some_cool_token'));

          expect(result.type, LOGIN_SUCCESS);
          expect(result.data, null);
        });

        test('Should return login failure if authorization failed', () async {

          Response fakeResponse = new Response('{"error": "Some error message!"}', 200);
          when(httpClient.post(url, headers: _headers, body: JSON.encode(data))).thenReturn(fakeResponse);

          var action = new Action(LOGIN_REQUEST, data);
          var result = await middleware.apply(store)(next)(action);
          expect(result.type, LOGIN_FAILURE);
          expect(result.data, {'message': 'Some error message!'});
        });

        test('Should return api error action if authorization request failed', () async {
          var testToken = 'test_token';

          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn(testToken);

          Response fakeResponse = new Response('Some error message!', 400);
          when(httpClient.post(url, headers: _headers, body: JSON.encode(data))).thenReturn(fakeResponse);

          var action = new Action(LOGIN_REQUEST, data);
          var result = await middleware.apply(store)(next)(action);
          expect(result.type, BAD_REQUEST_ACTION);
          expect(result.data, {'response': 'Some error message!'});
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

          var result = await middleware.apply(store)(mockNext)(action);

          expect(calls, 0);
          expect(result, {});
        });

        test('Should return login success if there is token', () async {

          when(localStorage.getItem(ApiMiddleware.TOKEN_KEY)).thenReturn('some_key');

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
