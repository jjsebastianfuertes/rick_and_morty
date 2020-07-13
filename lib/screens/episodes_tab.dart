import 'package:flavors_example/models/episodes_endpoint/episodes_model.dart';
import 'package:flavors_example/providers/episodes_provider.dart';
import 'package:flavors_example/screens/episodes_screen.dart';
import 'package:flavors_example/widgets/card_episode.dart';
import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:provider/provider.dart';

class EpisodesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginationView<EpisodeModel>(
      padding: const EdgeInsets.all(15),
      separatorBuilder: (BuildContext context, _) => SizedBox(height: 10),
      onEmpty: Center(
        child: Text("No data to present right now"),
      ),
      onError: (err) => Center(
        child: Text(err),
      ),
      pageFetch:
          Provider.of<EpisodesProvider>(context, listen: false).fetchEpisodes,
      paginationViewType: PaginationViewType.listView,
      itemBuilder: (BuildContext context, EpisodeModel episode, int index) {
        return InkWell(
          onTap: () {
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
          child: CardEpisode(episode),
        );
      },
    );
  }
}
