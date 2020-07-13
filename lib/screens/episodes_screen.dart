import 'package:flavors_example/providers/episodes_provider.dart';
import 'package:flavors_example/widgets/epidose.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EpisodesScreen extends StatelessWidget {
  final int id;
  final String name;

  EpisodesScreen({
    @required this.id,
    @required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Provider.of<EpisodesProvider>(context, listen: false)
            .fetchEpisodesWithCharacters(id),
        builder: (BuildContext context, episode) {
          if (episode.connectionState == ConnectionState.done) {
            if (episode.data == null) {
              return Center(
                child: Text(
                  "Sorry this character has disappeared",
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        color: Theme.of(context).primaryColorDark,
                      ),
                ),
              );
            } else {
              return Episode(episode.data);
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
