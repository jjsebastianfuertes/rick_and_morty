import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/characters_endpoint/character_model.dart';
import '../providers/characters_provider.dart';
import '../screens/episodes_screen.dart';

class Character extends StatelessWidget {
  final CharacterModel character;
  Character(this.character);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: <Widget>[
        FadeInImage.assetNetwork(
          image: character.image,
          placeholder: "assets/loading.gif",
          placeholderScale: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
        ),
        Text(
          "${character.name} (${character.status})",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.location_on),
          label: Text(
            character.location.name,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
        Text(
          "${character.species} - ${character.type}",
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        Divider(),
        SizedBox(height: 15),
        Text(
          "EPISODES",
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        Consumer<CharacterProvider>(
          builder: (context, character, _) {
            return Wrap(
              spacing: 5,
              children: character.episodes
                  .map<Widget>(
                    (episode) => RaisedButton.icon(
                      color: Theme.of(context).backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EpisodesScreen(
                              id: episode.id,
                              name: episode.name,
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.movie,
                        size: 15,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      label: Text(
                        episode.name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}
