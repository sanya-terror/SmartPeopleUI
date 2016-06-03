class AuthorizationError extends ApiError {
  AuthorizationError([Map<String, dynamic> data = const {}]) : super(401, data);
}

class ApiError extends Error {
  int statusCode;
  Map<String, dynamic> data;
  ApiError(int this.statusCode, Map<String, dynamic> this.data);
}