import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientMock extends Mock implements Client {}

class DioHttpClientMock extends Mock implements Dio {
  @override
  late BaseOptions options;
  DioHttpClientMock(this.options);
}
