abstract class HttpClient {
  Future<dynamic> get({required String url, Map<String, String>? headers});
  // Future<dynamic> post(
  //     {required String url, Map? body, Map<String, String>? headers});
}
