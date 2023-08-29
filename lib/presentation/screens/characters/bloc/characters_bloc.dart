import 'package:cleanpotter/core/errors/unexpected_error.dart';
import 'package:cleanpotter/data/errors/load_characters_error.dart';
import 'package:cleanpotter/domain/entities/character_entity.dart';
import 'package:cleanpotter/domain/usecases/load_characters_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final LoadCharacters loadCharactersUseCase;

  CharactersBloc({required this.loadCharactersUseCase})
      : super(CharactersLoadingState()) {
    on<CharactersLoadEvent>(_onLoadCharacters);
  }

  void _onLoadCharacters(
    CharactersLoadEvent event,
    Emitter<CharactersState> emit,
  ) async {
    try {
      final loadedCharacters = await loadCharactersUseCase();
      emit(CharactersLoadSuccessState(characters: loadedCharacters));
    } on LoadCharactersError catch (error) {
      emit(CharactersLoadErrorState(errorMessage: error.message));
    } on UnexpectedError catch (error) {
      emit(CharactersLoadErrorState(errorMessage: error.message));
    }
  }
}
