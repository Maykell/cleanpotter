import 'package:cleanpotter/domain/entities/character_entity.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> loadCharacters();
}
