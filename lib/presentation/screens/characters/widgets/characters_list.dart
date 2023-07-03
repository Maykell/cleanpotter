import 'package:cleanpotter/domain/entities/character_entity.dart';
import 'package:cleanpotter/presentation/screens/characters/widgets/characters_list_item.dart';
import 'package:flutter/material.dart';

class CharactersList extends StatelessWidget {
  final List<CharacterEntity> characters;

  const CharactersList({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (_, index) {
        final character = characters[index];
        return CharacterListItem(character: character);
      },
    );
  }
}
