import 'package:cleanpotter/data/errors/http/bad_request_error.dart';
import 'package:cleanpotter/data/errors/http/internal_server_error.dart';
import 'package:cleanpotter/infra/http/http_client_adapter.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/http_client_mock.dart';

void main() {
  late Client client;
  late HttpClientAdapter sut;
  late String url;

  setUp(() {
    client = HttpClientMock();
    sut = HttpClientAdapter(client: client);
  });

  setUpAll(() {
    url = faker.internet.httpsUrl();
    registerFallbackValue(Uri.parse(url));
  });

  group('HttpClientAdapter', () {
    group('Get method', () {
      group('Should throw a FormatException when', () {
        test('param url is invalid', () {
          Future request = sut.get(url: ':::::INVALID_URL::::');

          expect(request, throwsA(isA<FormatException>()));
        });

        test('receive a invalid json data', () {
          const String invalidJsonResponse = 'invalid_data';

          when(() => client.get(any(), headers: any(named: 'headers')))
              .thenAnswer((_) async => Response(invalidJsonResponse, 200));

          final future = sut.get(url: url);

          expect(future, throwsA(isA<FormatException>()));
        });
      });

      test('Should call get with correct values', () async {
        when(() => client.get(any(), headers: any(named: 'headers')))
            .thenAnswer((_) async => Response('{"any_key":"any_value"}', 200));

        await sut.get(url: url, headers: {'authorization': 'Bearear xxxxxx'});

        verify(() => client.get(
              Uri.parse(url),
              headers: {
                'content-type': 'application/json',
                'accept': 'application/json',
                'authorization': 'Bearear xxxxxx',
              },
            ));
      });

      test('Should return data when status code is 200', () async {
        final Map<String, String> decodedBody = {'any_key': 'any_value'};

        when(() => client.get(any(), headers: any(named: 'headers')))
            .thenAnswer((_) async => Response('{"any_key":"any_value"}', 200));

        final response = await sut.get(url: url);

        expect(response, decodedBody);
      });

      test('Should return BadRequestError if receive a 400 from server', () {
        when(() => client.get(any(), headers: any(named: 'headers')))
            .thenAnswer((_) async =>
                Response('{"any_error_key":"any_error_value"}', 400));

        final response = sut.get(url: url);

        expect(
            response,
            throwsA(
              isA<BadRequestError>().having(
                (error) => error.message,
                'message',
                'any_error_value',
              ),
            ));
      });

      test('Should return InternalServerError if receive a 500 from server',
          () {
        when(() => client.get(any(), headers: any(named: 'headers')))
            .thenThrow(InternalServerError());

        final response = sut.get(url: url);

        expect(
            response,
            throwsA(
              isA<InternalServerError>().having(
                (error) => error.message,
                'message',
                'a internal server error occours',
              ),
            ));
      });
    });
  });
}
