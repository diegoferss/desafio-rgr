class Endpoint {
  final String path;
  final String method;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? queryParameters;

  Endpoint({
    required this.path,
    required this.method,
    this.body,
    this.queryParameters,
  });
}
