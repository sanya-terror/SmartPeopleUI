import 'package:SmartPeopleUI/redux/index.dart';

const UNAUTHORIZED_ACTION = 'UNAUTHORIZED_ACTION';
const API_ERROR_ACTION = 'API_ERROR_ACTION';

class ApiAction extends Action {
  String endpoint;
  String method;
  ApiAction(String type, this.endpoint, [String this.method = 'GET', Map<String, dynamic> data = null])
  : super(type, data){
    if (method != 'GET' && method != 'POST' && method != 'PUT' && method != 'DELETE')
      throw new ArgumentError.value(method, 'method', 'Non-supported method');
  }
}

class ApiActionCreator {

  static ApiAction apiAction(String type, String endpoint, String method, [Map<String, dynamic> data = null]) =>
    new ApiAction(type, endpoint, method, data);

  static ApiAction postApiAction(String type, String endpoint, [Map<String, dynamic> data = null]) =>
    new ApiAction(type, endpoint, 'POST', data);

  static ApiAction putApiAction(String type, String endpoint, [Map<String, dynamic> data = null]) =>
    new ApiAction(type, endpoint, 'PUT', data);

  static ApiAction deleteApiAction(String type, String endpoint, [Map<String, dynamic> data = null]) =>
    new ApiAction(type, endpoint, 'DELETE', data);

  static ApiAction getApiAction(String type, String endpoint, [Map<String, dynamic> data = null]) =>
    new ApiAction(type, endpoint, 'GET', data);

  static Action unauthorizedAction() => new Action(UNAUTHORIZED_ACTION);
  static Action apiErrorAction() => new Action(API_ERROR_ACTION);
}