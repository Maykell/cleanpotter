import 'package:equatable/equatable.dart';
import 'package:cleanpotter/domain/entities/character_entity.dart';

sealed class LoadCharactersState extends Equatable {
  const LoadCharactersState();
}

class LoadCharactersLoadingState extends LoadCharactersState {
  const LoadCharactersLoadingState();

  @override
  List<Object> get props => [];
}

class LoadCharactersSuccessState extends LoadCharactersState {
  final List<CharacterEntity> characters;

  const LoadCharactersSuccessState({required this.characters});

  @override
  List<Object> get props => [];
}

class LoadCharactersErrorState extends LoadCharactersState {
  final String errorMessage;

  const LoadCharactersErrorState({required this.errorMessage});

  @override
  List<Object> get props => [];
}
