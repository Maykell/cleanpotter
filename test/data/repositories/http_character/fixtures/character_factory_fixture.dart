import 'package:cleanpotter/domain/entities/character_entity.dart';

class CharacterFactoryFixture {
  static List<Map<String, dynamic>> makeJsonList() => [
        {
          'id': '9e3f7ce4',
          'name': 'Harry Potter',
          'dateOfBirth': '22-02-2023',
          'image': 'https://ik.imagekit.io/hpapi/harry.jpg',
        },
      ];

  static List<CharacterEntity> makeEntityList() => [
        CharacterEntity(
          id: '9e3f7ce4',
          name: 'Harry',
          dateOfBirth: '22-02-2023',
          photo: 'https://ik.imagekit.io/hpapi/harry.jpg',
        )
      ];
}
