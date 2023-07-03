import 'package:equatable/equatable.dart';

sealed class LoadCharactersEvent extends Equatable {
  const LoadCharactersEvent();
}

final class LoadAllCharacters extends LoadCharactersEvent {
  @override
  List<Object?> get props => [];
}
