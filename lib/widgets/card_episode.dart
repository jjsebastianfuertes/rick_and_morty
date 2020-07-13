import 'package:flavors_example/core/widgets/card_tile.dart';
import 'package:flavors_example/core/widgets/tile.dart';
import 'package:flavors_example/core/widgets/tile_vertical.dart';
import 'package:flavors_example/models/episodes_endpoint/episodes_model.dart';
import 'package:flutter/material.dart';

class CardEpisode extends StatelessWidget {
  final EpisodeModel episode;
  CardEpisode(this.episode);
  @override
  Widget build(BuildContext context) {
    return CardTile(
      left: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Tile(title: "Episode: ", content: episode.episode),
            SizedBox(height: 5),
            Tile(title: "Name: ", content: episode.name),
            SizedBox(height: 5),
            Tile(title: "Air date: ", content: episode.airDate)
          ],
        ),
      ),
      right: TileVertical(
        title: "Characters",
        content: episode.characters.length.toString(),
      ),
    );
  }
}
