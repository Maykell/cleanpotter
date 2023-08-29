part of 'characters_bloc.dart';

sealed class CharactersState extends Equatable {
  final List<CharacterEntity> characters;
  final String errorMessage;

  const CharactersState({this.characters = const [], this.errorMessage = ''});

  @override
  List<Object> get props => [];
}

final class CharactersLoadingState extends CharactersState {}

final class CharactersLoadSuccessState extends CharactersState {
  const CharactersLoadSuccessState({super.characters});
}

final class CharactersLoadErrorState extends CharactersState {
  const CharactersLoadErrorState({super.errorMessage});
}
