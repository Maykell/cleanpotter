import 'package:cleanpotter/data/http/http_client.dart';
import 'package:cleanpotter/data/repositories/http_character_repository.dart';
import 'package:cleanpotter/domain/repositories/character_repository.dart';
import 'package:cleanpotter/domain/usecases/load_characters_usecase.dart';
import 'package:cleanpotter/infra/http/http_client_adapter.dart';
import 'package:cleanpotter/presentation/screens/characters/bloc/characters_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  _initExternalPackages();
  _initAdapters();
  _initRepositories();
  _initUseCases();
  _initBlocs();
}

void _initExternalPackages() {
  serviceLocator.registerLazySingleton<Client>(() => Client());
}

void _initAdapters() {
  serviceLocator.registerLazySingleton<HttpClient>(
      () => HttpClientAdapter(client: serviceLocator<Client>()));
}

void _initRepositories() {
  serviceLocator.registerLazySingleton<CharacterRepository>(
      () => HttpCharacterRepository(httpClient: serviceLocator<HttpClient>()));
}

void _initUseCases() {
  serviceLocator.registerLazySingleton<LoadCharacters>(() =>
      LoadCharactersUseCase(repository: serviceLocator<CharacterRepository>()));
}

void _initBlocs() {
  serviceLocator.registerFactory<CharactersBloc>(() =>
      CharactersBloc(loadCharactersUseCase: serviceLocator<LoadCharacters>()));
}
