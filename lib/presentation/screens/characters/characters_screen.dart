import 'package:cleanpotter/presentation/screens/characters/bloc/characters_bloc.dart';
import 'package:cleanpotter/presentation/screens/characters/widgets/characters_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  final CharactersBloc bloc;

  const CharactersScreen({required this.bloc, super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    widget.bloc.add(CharactersLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        bloc: widget.bloc,
        builder: (_, state) {
          return switch (state) {
            CharactersLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            CharactersLoadErrorState() => Center(
                child: Text(state.errorMessage),
              ),
            CharactersLoadSuccessState() => RefreshIndicator(
                child: CharactersList(
                  characters: state.characters,
                ),
                onRefresh: () => Future(
                  () => widget.bloc.add(CharactersLoadEvent()),
                ),
              ),
          };
        },
      ),
    );
  }
}
