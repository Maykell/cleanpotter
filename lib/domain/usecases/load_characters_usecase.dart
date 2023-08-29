import 'package:cleanpotter/domain/entities/character_entity.dart';
import 'package:cleanpotter/domain/repositories/character_repository.dart';

/// Regras especificas da aplicação/app.
/// Orquestram o fluxo de dados a partir das entidades.
/// Orientam a aplicação das regras nas entidades se necessário.
/// O que acontece aqui não deve afetar as entidades,
/// Da mesma forma que as partes externas não devem afetar os casos de uso.

abstract interface class LoadCharacters {
  Future<List<CharacterEntity>> call();
}

class LoadCharactersUseCase implements LoadCharacters {
  final CharacterRepository repository;

  LoadCharactersUseCase({required this.repository});

  @override
  Future<List<CharacterEntity>> call() async {
    return await repository.loadCharacters();
  }
}

//Usar classes para representar a entrada e sáida dos casos de uso
class LoadCharactersUseCaseParams {}

class LoadCharactersUseCaseOutput {}
