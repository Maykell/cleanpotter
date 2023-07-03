import 'package:cleanpotter/presentation/blocs/characters/load/load_characters_bloc.dart';
import 'package:cleanpotter/presentation/blocs/characters/load/load_characters_event.dart';
import 'package:cleanpotter/presentation/blocs/characters/load/load_characters_state.dart';
import 'package:cleanpotter/presentation/screens/characters/widgets/characters_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  final LoadCharactersBloc bloc;

  const CharactersScreen({required this.bloc, super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    widget.bloc.add(LoadAllCharacters());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: BlocProvider<LoadCharactersBloc>(
        create: (context) => widget.bloc,
        child: BlocBuilder<LoadCharactersBloc, LoadCharactersState>(
          builder: (_, state) {
            if (state is LoadCharactersLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is LoadCharactersErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            }

            if (state is LoadCharactersSuccessState) {
              return CharactersList(
                characters: state.characters,
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
