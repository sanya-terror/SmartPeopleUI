import 'package:http/http.dart';
import 'dart:async';

import 'package:SmartPeopleUI/redux/index.dart';

import '../services/local-storage.interface.dart';
import 'api.action-creator.dart';
import 'api.errors.dart';
import 'dart:convert';

class ApiMiddleware {

  static final BASE_URL = 'http://localhost:3001/api/';

  Client _httpClient;
  ILocalStorageService _localStorage;

  ApiMiddleware(ILocalStorageService this._localStorage, [Client httpClient = null]) {
    this._httpClient = (httpClient == null) ? new Client() : httpClient;
  }

  dynamic apply(Store store) => (Dispatcher next) => (Action action) async {

    if (!(action is ApiAction)) return next(action);

    ApiAction apiAction = action;
    var endpoint = apiAction.endpoint;

    try {
      var result = await _callApi(endpoint);
      return next(new Action(apiAction.type, result));
    } catch (error) {
print(error);
      if (error is AuthorizationError) return next(ApiActionCreator.unauthorizedAction());

      // TODO: Handle different status codes
      return next(ApiActionCreator.apiErrorAction());
    }
  };

  Future<dynamic> _callApi(String endpoint) async {

    String token = _localStorage.getItem('id_token');
    if (token == null) throw new AuthorizationError();

    final Map<String, String> _headers = { 'Authorization': token};
    final url = BASE_URL + endpoint;

    // TODO handle different method types
    Response response = await _httpClient.get(url, headers: _headers);

    var result = JSON.decode(response.body);
    if (response.statusCode != 200) throw new ApiError(response.statusCode, result);

    return result;
  }
}