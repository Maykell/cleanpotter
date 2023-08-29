abstract interface class HttpClient {
  Future<dynamic> get({required String url, Map<String, String>? headers});
}
