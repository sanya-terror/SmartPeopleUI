import 'package:SmartPeopleUI/redux/index.dart';

const UNAUTHORIZED_ACTION = 'UNAUTHORIZED_ACTION';
const API_ERROR_ACTION = 'API_ERROR_ACTION';

class ApiAction extends Action {
  String endpoint;
  ApiAction(String type, this.endpoint, [Map<String, dynamic> data = null])
  : super(type, data);
}

class ApiActionCreator {

  static ApiAction apiAction(String type, String endpoint, [Map<String, dynamic> data = null]) =>
    new ApiAction(type, endpoint, data);

  static Action unauthorizedAction() => new Action(UNAUTHORIZED_ACTION);
  static Action apiErrorAction() => new Action(API_ERROR_ACTION);
}