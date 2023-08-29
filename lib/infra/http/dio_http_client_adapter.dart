import 'package:cleanpotter/data/errors/http/bad_request_error.dart';
import 'package:cleanpotter/data/errors/http/internal_server_error.dart';
import 'package:cleanpotter/data/http/http_client.dart';
import 'package:dio/dio.dart';

class DioHttpClientAdapter implements HttpClient {
  final Dio dio;

  DioHttpClientAdapter(this.dio) {
    dio.options.baseUrl = 'https://hp-api.onrender.com/api/';
    dio.options.headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
  }

  @override
  Future get({required String url, Map<String, String>? headers}) async {
    dio.options.headers = {...dio.options.headers, ...?headers};
    Response response = await dio.get(url);
    return _handlingResponse(response);
  }

  dynamic _handlingResponse(Response response) {
    final decodedResponse = response.data;
    switch (response.statusCode) {
      case 200:
        return decodedResponse;
      case 400:
        String message = decodedResponse['any_error_key'];
        throw BadRequestError(message: message);
      case 500:
        throw InternalServerError();
      default:
        throw InternalServerError();
    }
  }
}
