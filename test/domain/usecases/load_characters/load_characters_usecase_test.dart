import 'package:cleanpotter/domain/entities/character_entity.dart';
import 'package:cleanpotter/domain/usecases/load_characters_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'fixtures/character_factory_fixture.dart';
import 'mocks/character_repository_mock.dart';

void main() {
  late LoadCharactersUseCase sut;
  late CharacterRepositoryMock repository;
  late List<CharacterEntity> characters;

  setUp(() {
    repository = CharacterRepositoryMock();
    sut = LoadCharactersUseCase(repository: repository);
    characters = CharacterFactoryFixture.makeCharacterList();
  });

  group('LoadCharactersUseCase', () {
    test('Should return a list of character entities type', () async {
      // Arrange
      when(() => repository.loadCharacters())
          .thenAnswer((_) async => <CharacterEntity>[]);
      // Act
      final result = await sut();

      // Assert
      expect(result, isA<List<CharacterEntity>>());
    });

    test('Should return a empty character list', () async {
      when(() => repository.loadCharacters())
          .thenAnswer((_) async => <CharacterEntity>[]);

      final result = await sut();

      expect(result, <CharacterEntity>[]);
    });

    test('Should return a character list', () async {
      when(() => repository.loadCharacters())
          .thenAnswer((_) async => characters);

      final result = await sut();

      expect(result, isA<List<CharacterEntity>>());
      expect(result.length, 2);
    });
  });
}
