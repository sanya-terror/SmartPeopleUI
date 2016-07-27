import 'dart:async';
import 'dart:convert';

import 'package:http/browser_client.dart';
import 'package:http/http.dart';

import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/index.dart'
    show ApiAction, ApiActionCreator, AuthorizationError, ApiError, LocalStorageService, SessionStorageService;
import 'package:SmartPeopleUI/account-management/index.dart';

import 'package:SmartPeopleUI/shared/actions.dart';

class ApiMiddleware {
  static final BASE_URL = 'http://localhost:9999/api';
  static final TOKEN_KEY = 'access_token';

  BrowserClient _httpClient;
  LocalStorageService _localStorage;
  SessionStorageService _sessionStorage;

  ApiMiddleware(LocalStorageService this._localStorage, SessionStorageService this._sessionStorage,
      [BrowserClient httpClient = null]) {
    this._httpClient = (httpClient == null) ? new BrowserClient() : httpClient;
  }

  dynamic apply(Store store) => (Dispatcher next) => (Action action) async {
        if (action.type == LOGIN_REQUEST) return next(await _tryAuthorize(action));
        if (action.type == LOGIN_CHECK) return _checkLogin(next);
        if (!(action is ApiAction)) return next(action);

        return next(await _tryCallApi(action));
      };

  dynamic _checkLogin(Dispatcher next) {
    String token = _localStorage.getItem(TOKEN_KEY) ?? _sessionStorage.getItem(TOKEN_KEY);

    if (token == null) return {};

    return next(AuthActionCreator.receiveLogin());
  }

  Future<Action> _tryAuthorize(Action action) async {
    try {
      bool rememberMe = action.data['rememberMe'];

      var result = await _callApi('/authorize', 'POST', body: action.data);

      String token = result['token'];
      int error = result['errorCode'];

      if (token == null) return AuthActionCreator.loginError(error);

      if (rememberMe)
        _localStorage.setItem(TOKEN_KEY, token);
      else
        _sessionStorage.setItem(TOKEN_KEY, token);

      return AuthActionCreator.receiveLogin();
    } catch (error) {
      return _handleError(error);
    }
  }

  Future<Action> _tryCallApi(ApiAction action) async {
    String token = _localStorage.getItem(TOKEN_KEY) ?? _sessionStorage.getItem(TOKEN_KEY);

    if (action.checkAuthorization && token == null) {
      return await ApiActionCreator.unauthorizedAction(new AuthorizationError());
    }

    try {
      var result = await _callApi(action.endpoint, action.method, token: token, body: action.data);
      return new Action(action.type, result);
    } catch (error) {
      return _handleError(error);
    }
  }

  Future<dynamic> _callApi(String endpoint, String method,
      {String token: null, Map<String, dynamic> body: const {}}) async {
    Map<String, String> _headers = {'Content-Type': 'application/json'};
    if (token != null) _headers['Authorization'] = token;

    final url = BASE_URL + endpoint;

    Response response = null;

    switch (method) {
      case 'POST':
        response = await _httpClient.post(url, headers: _headers, body: JSON.encode(body));
        break;
      case 'PUT':
        response = await _httpClient.put(url, headers: _headers, body: JSON.encode(body));
        break;
      case 'DELETE':
        response = await _httpClient.delete(url, headers: _headers);
        break;
      default:
        response = await _httpClient.get(url, headers: _headers);
    }

    if (response.statusCode != 200) throw new ApiError(response.statusCode, response.body);

    return JSON.decode(response.body);
  }

  Action _handleError(error) {
    if (error is ApiError) return _handleApiError(error);

    return new Action('GENERAL_ERROR_ACTION', {'error': error.toString()});
  }

  Action _handleApiError(ApiError error) {
    switch (error.statusCode) {
      case 400:
        return ApiActionCreator.badRequestAction(error);
      case 401:
        _localStorage.remove(TOKEN_KEY);
        _sessionStorage.remove(TOKEN_KEY);
        return ApiActionCreator.unauthorizedAction(error);
      case 403:
        return ApiActionCreator.forbiddenAction(error);
      case 404:
        return ApiActionCreator.notFoundAction(error);
      default:
        return ApiActionCreator.internalServerErrorAction(error);
    }
  }
}
