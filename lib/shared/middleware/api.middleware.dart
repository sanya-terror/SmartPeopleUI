import 'package:http/http.dart';
import 'dart:async';

import 'package:SmartPeopleUI/redux/index.dart';

import '../services/local-storage.interface.dart';
import '../authorization/index.dart';

import 'api.action-creator.dart';
import 'api.errors.dart';
import 'dart:convert';

class ApiMiddleware {

  static final BASE_URL = 'http://localhost:3001/api';

  Client _httpClient;
  ILocalStorageService _localStorage;

  ApiMiddleware(ILocalStorageService this._localStorage, [Client httpClient = null]) {
    this._httpClient = (httpClient == null) ? new Client() : httpClient;
  }

  dynamic apply(Store store) => (Dispatcher next) => (Action action) async {

    if(action.type == LOGIN_REQUEST) return next(await _tryAuthorize(action));

    if (!(action is ApiAction)) return next(action);

    return next(await _tryCallApi(action));
  };

  Future<Action> _tryAuthorize(Action action)async {

    try {
      var result = await _callApi('/authorize', body: action.data);

      if (result['token'] == null)
        return AuthorizationActionCreator.loginError(result['error']);

      return AuthorizationActionCreator.receiveLogin(result);
    } catch (error) {
      // TODO: Handle different status codes
      return ApiActionCreator.apiErrorAction();
    }
  }

  Future<Action> _tryCallApi(ApiAction action)async {

    String token = _localStorage.getItem('id_token');
    if (token == null) return ApiActionCreator.unauthorizedAction();

    try {
      var result = await _callApi(action.endpoint, token: token, body: action.data);
      return new Action(action.type, result);
    } catch (error) {
      // TODO: Handle different status codes
      return ApiActionCreator.apiErrorAction();
    }
  }

  Future<dynamic> _callApi(String endpoint, {String token: null, Map<String, dynamic> body: const {}}) async {

    Map<String, String> _headers = {};
    if (token != null)
      _headers['Authorization'] = token;

    final url = BASE_URL + endpoint;

    // TODO handle different method types
    Response response = await _httpClient.post(url, headers: _headers, body: body);

    var result = JSON.decode(response.body);
    if (response.statusCode != 200) throw new ApiError(response.statusCode, result);

    return result;
  }
}