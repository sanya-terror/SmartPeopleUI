import 'package:SmartPeopleUI/redux/index.dart';

import 'api.errors.dart';

class ApiAction extends Action {
  String endpoint;
  String method;

  ApiAction(String type, this.endpoint,
      [String this.method = 'GET', Map<String, dynamic> data = null])
      : super(type, data) {
    var allowedMethods = ['GET', 'POST', 'PUT', 'DELETE'];
    if (!allowedMethods.contains(method))
      throw new ArgumentError.value(method, 'method', 'Non-supported method');
  }
}

const BAD_REQUEST_ACTION = 'BAD_REQUEST_ACTION';
const FORBIDDEN_ACTION = 'FORBIDDEN_ACTION';
const UNAUTHORIZED_ACTION = 'UNAUTHORIZED_ACTION';
const NOT_FOUND_ACTION = 'NOT_FOUND_ACTION';
const INTERNAL_SERVER_ERROR_ACTION = 'INTERNAL_SERVER_ERROR_ACTION';

class ApiErrorAction extends Action {
  ApiErrorAction(String type, ApiError error) : super(type, error.data) {
    var allowedActions = [
      BAD_REQUEST_ACTION,
      UNAUTHORIZED_ACTION,
      FORBIDDEN_ACTION,
      NOT_FOUND_ACTION,
      INTERNAL_SERVER_ERROR_ACTION
    ];

    if (!allowedActions.contains(type))
      throw new ArgumentError.value(type, 'type', 'Non-supported type');
  }
}

class ApiActionCreator {
  static ApiAction apiAction(String type, String endpoint, String method,
          [Map<String, dynamic> data = null]) =>
      new ApiAction(type, endpoint, method, data);

  static ApiAction postApiAction(String type, String endpoint,
          [Map<String, dynamic> data = null]) =>
      new ApiAction(type, endpoint, 'POST', data);

  static ApiAction putApiAction(String type, String endpoint,
          [Map<String, dynamic> data = null]) =>
      new ApiAction(type, endpoint, 'PUT', data);

  static ApiAction deleteApiAction(String type, String endpoint,
          [Map<String, dynamic> data = null]) =>
      new ApiAction(type, endpoint, 'DELETE', data);

  static ApiAction getApiAction(String type, String endpoint,
          [Map<String, dynamic> data = null]) =>
      new ApiAction(type, endpoint, 'GET', data);

  static ApiErrorAction unauthorizedAction(ApiError error) =>
      new ApiErrorAction(UNAUTHORIZED_ACTION, error);

  static ApiErrorAction notFoundAction(ApiError error) =>
      new ApiErrorAction(NOT_FOUND_ACTION, error);

  static ApiErrorAction badRequestAction(ApiError error) =>
      new ApiErrorAction(BAD_REQUEST_ACTION, error);

  static ApiErrorAction forbiddenAction(ApiError error) =>
      new ApiErrorAction(FORBIDDEN_ACTION, error);

  static ApiErrorAction internalServerErrorAction(ApiError error) =>
      new ApiErrorAction(INTERNAL_SERVER_ERROR_ACTION, error);
}
