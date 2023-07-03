import 'package:cleanpotter/core/errors/unexpected_error.dart';
import 'package:cleanpotter/data/dtos/character_dto.dart';
import 'package:cleanpotter/data/errors/http/bad_request_error.dart';
import 'package:cleanpotter/data/errors/http/internal_server_error.dart';
import 'package:cleanpotter/data/errors/load_characters_error.dart';
import 'package:cleanpotter/data/http/http_client.dart';
import 'package:cleanpotter/domain/entities/character_entity.dart';
import 'package:cleanpotter/domain/repositories/character_repository.dart';

class HttpCharacterRepository implements CharacterRepository {
  final HttpClient httpClient;

  HttpCharacterRepository({required this.httpClient});

  @override
  Future<List<CharacterEntity>> loadCharacters() async {
    try {
      final httpResponse = await httpClient.get(
          url: 'https://hp-api.onrender.com/api/characters');
      return httpResponse
          .map<CharacterEntity>(
              (character) => CharacterDTO.fromMap(character).toEntity())
          .toList();
    } on BadRequestError catch (error) {
      throw LoadCharactersError(message: error.message);
    } on InternalServerError catch (error) {
      throw LoadCharactersError(message: error.message);
    } catch (error) {
      throw UnexpectedError();
    }
  }
}
