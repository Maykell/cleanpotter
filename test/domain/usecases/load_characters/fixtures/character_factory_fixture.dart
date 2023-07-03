import 'package:cleanpotter/domain/entities/character_entity.dart';

class CharacterFactoryFixture {
  static List<CharacterEntity> makeCharacterList() => [
        CharacterEntity(
          name: 'any_name',
          dateOfBirth: '22-02-2023',
          photo: 'any_url',
        ),
        CharacterEntity(
          name: 'any_name',
          dateOfBirth: '22-02-2023',
          photo: 'any_url',
        )
      ];
}
