import 'package:SmartPeopleUI/redux/index.dart';

import 'api.errors.dart';

import 'package:SmartPeopleUI/index.dart'
    show
        ERROR_BAD_REQUEST,
        ERROR_FORBIDDEN,
        ERROR_INTERNAL_SERVER,
        ERROR_NOT_FOUND,
        ERROR_REMOVE_BAD_REQUEST,
        ERROR_REMOVE_INTERNAL_SERVER,
        ERROR_REMOVE_NOT_FOUND,
        ERROR_REMOVE_UNAUTHORIZED,
        ERROR_UNAUTHORIZED,
        ERROR_REMOVE_FORBIDDEN;

class ApiAction extends Action {
  String endpoint;
  String method;
  bool checkAuthorization;

  ApiAction(String type, this.endpoint,
      [String this.method = 'GET', Map<String, dynamic> data = null, bool this.checkAuthorization = true])
      : super(type, data) {
    var allowedMethods = ['GET', 'POST', 'PUT', 'DELETE'];
    if (!allowedMethods.contains(method)) throw new ArgumentError.value(method, 'method', 'Non-supported method');
  }
}

class ApiErrorAction extends Action {
  ApiErrorAction(String type, ApiError error)
      : super(type, {'message': error.message, 'stackTrace': error.stackTrace}) {
    var allowedActions = [
      ERROR_BAD_REQUEST,
      ERROR_UNAUTHORIZED,
      ERROR_FORBIDDEN,
      ERROR_NOT_FOUND,
      ERROR_INTERNAL_SERVER,
      ERROR_REMOVE_FORBIDDEN
    ];

    if (!allowedActions.contains(type)) throw new ArgumentError.value(type, 'type', 'Non-supported type');
  }
}

class ApiActionCreator {
  static ApiAction apiAction(String type, String endpoint, String method,
          [Map<String, dynamic> data = null, bool checkAuthorization = true]) =>
      new ApiAction(type, endpoint, method, data, checkAuthorization);

  static ApiAction postApiAction(String type, String endpoint,
          [Map<String, dynamic> data = null, bool checkAuthorization = true]) =>
      new ApiAction(type, endpoint, 'POST', data, checkAuthorization);

  static ApiAction putApiAction(String type, String endpoint,
          [Map<String, dynamic> data = null, bool checkAuthorization = true]) =>
      new ApiAction(type, endpoint, 'PUT', data, checkAuthorization);

  static ApiAction deleteApiAction(String type, String endpoint,
          [Map<String, dynamic> data = null, bool checkAuthorization = true]) =>
      new ApiAction(type, endpoint, 'DELETE', data, checkAuthorization);

  static ApiAction getApiAction(String type, String endpoint,
          [Map<String, dynamic> data = null, bool checkAuthorization = true]) =>
      new ApiAction(type, endpoint, 'GET', data, checkAuthorization);

  static ApiErrorAction unauthorizedAction(ApiError error) => new ApiErrorAction(ERROR_UNAUTHORIZED, error);

  static Action unauthorizedCleanAction() => new Action(ERROR_REMOVE_UNAUTHORIZED);

  static ApiErrorAction notFoundAction(ApiError error) => new ApiErrorAction(ERROR_NOT_FOUND, error);

  static Action notFoundCleanAction() => new Action(ERROR_REMOVE_NOT_FOUND);

  static ApiErrorAction badRequestAction(ApiError error) => new ApiErrorAction(ERROR_BAD_REQUEST, error);

  static Action badRequestErrorCleanAction() => new Action(ERROR_REMOVE_BAD_REQUEST);

  static ApiErrorAction forbiddenAction(ApiError error) => new ApiErrorAction(ERROR_FORBIDDEN, error);

  static Action forbiddenCleanAction() => new Action(ERROR_REMOVE_FORBIDDEN);

  static ApiErrorAction internalServerErrorAction(ApiError error) => new ApiErrorAction(ERROR_INTERNAL_SERVER, error);

  static Action internalServerErrorCleanAction() => new Action(ERROR_REMOVE_INTERNAL_SERVER);
}
