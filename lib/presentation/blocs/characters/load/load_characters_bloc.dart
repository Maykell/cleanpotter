import 'package:cleanpotter/core/errors/unexpected_error.dart';
import 'package:cleanpotter/data/errors/load_characters_error.dart';
import 'package:cleanpotter/domain/usecases/load_characters_usecase.dart';
import 'package:cleanpotter/presentation/blocs/characters/load/load_characters_event.dart';
import 'package:cleanpotter/presentation/blocs/characters/load/load_characters_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadCharactersBloc
    extends Bloc<LoadCharactersEvent, LoadCharactersState> {
  final LoadCharacters loadCharactersUseCase;

  LoadCharactersBloc({required this.loadCharactersUseCase})
      : super(const LoadCharactersLoadingState()) {
    on<LoadAllCharacters>(onLoadAllCharacters);
  }

  void onLoadAllCharacters(
      LoadAllCharacters event, Emitter<LoadCharactersState> emit) async {
    emit(const LoadCharactersLoadingState());
    try {
      final loadedCharacters = await loadCharactersUseCase();
      emit(LoadCharactersSuccessState(characters: loadedCharacters));
    } on LoadCharactersError catch (error) {
      emit(LoadCharactersErrorState(errorMessage: error.message));
    } on UnexpectedError catch (error) {
      emit(LoadCharactersErrorState(errorMessage: error.message));
    }
  }
}
