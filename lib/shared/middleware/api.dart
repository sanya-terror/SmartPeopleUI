import 'package:SmartPeopleUI/redux/index.dart';
import 'package:SmartPeopleUI/shared/services/localStorageService.dart';
import 'package:http/http.dart';
import 'dart:async';

const CALL_API = 'CALL_API';

class ApiAction extends Action {
  String endpoint;
  String successType;
  String errorType;
  ApiAction(this.endpoint, this.successType, this.errorType, [Map<String, dynamic> data = null])
  : super(CALL_API, data);
}

class AuthorizationError extends Error {}

class ApiError extends Error {
  int statusCode;
  String error;
  ApiError(int this.statusCode, String this.error);
}

class ApiMiddleware {

  final _baseUrl = 'http://localhost:3001/api/';

  Client _httpClient;
  LocalStorageService _localStorage;

  ApiMiddleware(LocalStorageService this._localStorage, [Client httpClient = null]) {
    this._httpClient = (httpClient == null) ? new Client() : httpClient;
  }

  dynamic apply(Store store) => (Dispatcher next) => (Action action) async {
    if (action.type != CALL_API) return next(action);

    ApiAction apiAction = action;
    var endpoint = apiAction.endpoint;

    try {
      var result = await _callApi(endpoint);
      return next(new Action(apiAction.successType, result));
    } catch (error) {
      if (error is AuthorizationError) return next(new Action(apiAction.errorType));
      if (error is ApiError) return next(new Action(apiAction.errorType));
      return next(new Action(apiAction.errorType));
    }
  };

  Future<dynamic> _callApi(String endpoint) async {
    var token = _localStorage.getItem('id_token') || null;
    if (token == null) throw new AuthorizationError();

    final Map<String, String> _headers = { 'Authorization': token};
    final url = _baseUrl + endpoint;
    Response response = await _httpClient.get(url, headers: _headers);

    if (response.statusCode != 200) throw new ApiError(response.statusCode, response.body);

    return response.body;
  }
}