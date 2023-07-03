import 'package:cleanpotter/core/errors/unexpected_error.dart';
import 'package:cleanpotter/data/errors/http/bad_request_error.dart';
import 'package:cleanpotter/data/errors/http/internal_server_error.dart';
import 'package:cleanpotter/data/errors/load_characters_error.dart';
import 'package:cleanpotter/data/repositories/http_character_repository.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cleanpotter/data/http/http_client.dart';
import 'package:cleanpotter/domain/entities/character_entity.dart';

import 'fixtures/character_factory_fixture.dart';
import 'mocks/http_character_repository_mock.dart';

void main() {
  late HttpClient httpClient;
  late HttpCharacterRepository sut;
  late String url;

  setUp(() {
    httpClient = HttpClientAdapterMock();
    sut = HttpCharacterRepository(httpClient: httpClient);
  });

  setUpAll(() {
    url = faker.internet.httpsUrl();
    registerFallbackValue(url);
  });

  group('HttpCharacterRepository', () {
    test('Should return all characters', () async {
      when(() => httpClient.get(
            url: any(named: 'url'),
            headers: any(named: 'headers'),
          )).thenAnswer((_) async => CharacterFactoryFixture.makeJsonList());

      final characters = await sut.loadCharacters();

      expect(characters, isNotEmpty);
      expect(characters, isA<List<CharacterEntity>>());
    });

    test('Should return a BadRequestError when receive a 400', () {
      when(() => httpClient.get(
            url: any(named: 'url'),
            headers: any(named: 'headers'),
          )).thenThrow(BadRequestError(message: 'any_bad_request_message'));

      final future = sut.loadCharacters();

      expect(
          future,
          throwsA(
            isA<LoadCharactersError>().having(
              (error) => error.message,
              'message',
              'any_bad_request_message',
            ),
          ));
    });

    test('Should return a InternalServerError when receive a 500', () {
      when(() => httpClient.get(
            url: any(named: 'url'),
            headers: any(named: 'headers'),
          )).thenThrow(InternalServerError());

      final future = sut.loadCharacters();

      expect(
          future,
          throwsA(
            isA<LoadCharactersError>().having(
              (error) => error.message,
              'message',
              'a internal server error occours',
            ),
          ));
    });

    test('Should return a UnexpectedError when any other error occours', () {
      when(() => httpClient.get(
            url: any(named: 'url'),
            headers: any(named: 'headers'),
          )).thenThrow(Exception());

      final future = sut.loadCharacters();

      expect(future, throwsA(isA<UnexpectedError>()));
    });
  });
}
