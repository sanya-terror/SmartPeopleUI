class AuthorizationError extends Error {}

class ApiError extends Error {
  int statusCode;
  String error;
  ApiError(int this.statusCode, String this.error);
}