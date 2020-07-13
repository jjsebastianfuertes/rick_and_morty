import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/locations_endpoint/location_model.dart';
import '../providers/locations_provider.dart';
import '../screens/character_screen.dart';

class Location extends StatelessWidget {
  final LocationModel location;
  Location(this.location);

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
                location.name,
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
                Text(location.type,
                    style: Theme.of(context).textTheme.subtitle1),
                Text(location.dimension,
                    style: Theme.of(context).textTheme.subtitle1),
              ],
            ),
          ],
        ),
        Divider(),
        SizedBox(height: 20),
        Text(
          "RESIDENTS",
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(height: 5),
        Consumer<LocationsProvider>(
          builder: (context, location, _) {
            return Wrap(
              spacing: 5,
              children: location.characters
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
