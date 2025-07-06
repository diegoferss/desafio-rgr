sealed class ApiResult {}

class ApiSuccess extends ApiResult {
  final dynamic data;

  ApiSuccess({required this.data});
}

class ApiError extends ApiResult {
  final String message;

  ApiError({required this.message});
}