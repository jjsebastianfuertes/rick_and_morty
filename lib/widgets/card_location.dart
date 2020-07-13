import 'package:flutter/material.dart';

import '../core/widgets/card_tile.dart';
import '../core/widgets/tile.dart';
import '../core/widgets/tile_vertical.dart';
import '../models/locations_endpoint/location_model.dart';

class CardLocation extends StatelessWidget {
  final LocationModel location;
  CardLocation(this.location);
  @override
  Widget build(BuildContext context) {
    return CardTile(
      left: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Tile(title: "Name: ", content: location.name),
            SizedBox(height: 5),
            Tile(title: "Type: ", content: location.type),
            SizedBox(height: 5),
            Tile(title: "Dimension: ", content: location.dimension)
          ],
        ),
      ),
      right: TileVertical(
        title: "Residents",
        content: location.residents.length.toString(),
      ),
    );
  }
}
