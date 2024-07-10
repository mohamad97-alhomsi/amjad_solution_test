class ApiResponse {
  final dynamic body;
  final dynamic headers;
  final dynamic statusCode;

  const ApiResponse({
    required this.body,
    required this.headers,
   this.statusCode
  });
}
