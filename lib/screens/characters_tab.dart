import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:provider/provider.dart';

import '../models/characters_endpoint/character_model.dart';
import '../providers/characters_provider.dart';
import '../widgets/card_character.dart';
import 'character_screen.dart';

class CharactersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginationView<CharacterModel>(
      padding: const EdgeInsets.all(15),
      separatorBuilder: (BuildContext context, _) => SizedBox(height: 10),
      onEmpty: Center(
        child: Text("No data to present right now"),
      ),
      onError: (err) => Center(
        child: Text(err),
      ),
      pageFetch: Provider.of<CharacterProvider>(context, listen: false)
          .fetchCharacters,
      paginationViewType: PaginationViewType.listView,
      itemBuilder:
          (BuildContext context, CharacterModel characters, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CharacterScreen(
                  id: characters.id,
                  name: characters.name,
                ),
              ),
            );
          },
          child: CardCharacter(characters),
        );
      },
    );
  }
}
