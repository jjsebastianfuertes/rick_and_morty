import 'package:flavors_example/models/episodes_endpoint/episodes_model.dart';
import 'package:flavors_example/providers/episodes_provider.dart';
import 'package:flavors_example/screens/character_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Episode extends StatelessWidget {
  final EpisodeModel episode;
  Episode(this.episode);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Text(
                episode.name,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(color: Theme.of(context).primaryColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(episode.episode,
                    style: Theme.of(context).textTheme.subtitle1),
                Text(episode.airDate,
                    style: Theme.of(context).textTheme.subtitle1),
              ],
            ),
          ],
        ),
        Divider(),
        SizedBox(height: 20),
        Text(
          "CHARACTERS",
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(height: 5),
        Consumer<EpisodesProvider>(
          builder: (context, episode, _) {
            return Wrap(
              spacing: 5,
              children: episode.characters
                  .map<Widget>(
                    (character) => RaisedButton.icon(
                      color: Theme.of(context).backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CharacterScreen(
                              id: character.id,
                              name: character.name,
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.person,
                        size: 15,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      label: Text(
                        character.name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        )
      ],
    );
  }
}
