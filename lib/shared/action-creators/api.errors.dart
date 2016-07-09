class AuthorizationError extends ApiError {
  AuthorizationError([String data = '']) : super(401, data);
}

class ApiError extends Error {
  int statusCode;
  String message;
  ApiError(this.statusCode, this.message);
}
