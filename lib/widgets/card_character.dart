import 'package:flavors_example/models/characters_endpoint/character_model.dart';
import 'package:flutter/material.dart';

class CardCharacter extends StatelessWidget {
  final CharacterModel characters;
  CardCharacter(this.characters);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: Theme.of(context).cardColor,
        margin: EdgeInsets.all(0),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.horizontal,
          children: <Widget>[
            Image.network(
              characters.image,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    characters.name,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    "${characters.status} - ${characters.species}",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    "Origin:",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    characters.origin.name,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    "Last known location:",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    characters.location.name,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
