import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/characters_provider.dart';
import '../widgets/character.dart';

class CharacterScreen extends StatelessWidget {
  final int id;
  final String name;
  CharacterScreen({@required this.id, @required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Provider.of<CharacterProvider>(context, listen: false)
            .fetchCharacterWithEpisodes(id),
        builder: (BuildContext context, character) {
          if (character.connectionState == ConnectionState.done) {
            if (character.data == null) {
              return Center(
                child: Text(
                  "Sorry this character has disappeared",
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        color: Theme.of(context).primaryColorDark,
                      ),
                ),
              );
            } else {
              return Character(character.data);
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
