abstract class ApiConsumer {
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters, bool sendToken = false});

  Future<dynamic> post(String path,
      {required dynamic body,
      Map<String, dynamic>? queryParameters,
      bool sendToken = false});
}
