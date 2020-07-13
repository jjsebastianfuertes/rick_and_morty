import 'package:flavors_example/models/characters_endpoint/character_model.dart';
import 'package:flavors_example/providers/characters_provider.dart';
import 'package:flavors_example/screens/character_screen.dart';
import 'package:flavors_example/widgets/card_character.dart';
import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:provider/provider.dart';

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
