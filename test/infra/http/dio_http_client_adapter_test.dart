import 'package:cleanpotter/infra/http/dio_http_client_adapter.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/http_client_mock.dart';

void main() {
  late DioHttpClientAdapter sut;
  late Dio client;
  late String url;

  setUp(() {
    client = DioHttpClientMock(BaseOptions());
    sut = DioHttpClientAdapter(client);
  });

  setUpAll(() {
    url = faker.internet.httpsUrl();
    registerFallbackValue(url);
  });

  group('DioHttpClientAdapter', () {
    test('Should call get with correct values', () async {
      when(() => client.get(any())).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
        ),
      );

      await sut.get(url: url, headers: {'authorization': 'Bearer xxxxxx'});

      verify(() => client.get(url));

      expect(client.options.headers, {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': 'Bearer xxxxxx'
      });
      expect(client.options.baseUrl, 'https://hp-api.onrender.com/api/');
    });
  });
}
