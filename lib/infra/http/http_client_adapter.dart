import 'dart:convert';

import 'package:cleanpotter/data/errors/http/bad_request_error.dart';
import 'package:cleanpotter/data/errors/http/internal_server_error.dart';
import 'package:cleanpotter/data/http/http_client.dart';
import 'package:http/http.dart';

class HttpClientAdapter implements HttpClient {
  final Client client;

  HttpClientAdapter({required this.client});

  @override
  Future get({required String url, Map<String, String>? headers}) async {
    Response response =
        await client.get(Uri.parse(url), headers: _mergedHeaders(headers));

    return _handlingResponse(response);
  }

  Map<String, String> _mergedHeaders(Map<String, String>? headers) => {
        ...{
          'content-type': 'application/json',
          'accept': 'application/json',
        },
        ...?headers
      };

  dynamic _handlingResponse(Response response) {
    final decodedResponse = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return decodedResponse;
      case 400:
        String message = decodedResponse['any_error_key'];
        throw BadRequestError(message: message);
      case 500:
        return InternalServerError();
      default:
        return InternalServerError();
    }
  }
}
