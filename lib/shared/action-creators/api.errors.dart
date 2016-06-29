class AuthorizationError extends ApiError {
  AuthorizationError([String data = '']) : super(401, data);
}

class ApiError extends Error {
  int statusCode;
  String response;
  ApiError(int this.statusCode, String this.response);
}
