import './episodes_info_model.dart';
import './episodes_model.dart';

class EpisodesListModel {
  EpisodesListModel({
    this.info,
    this.results,
  });

  EpisodesInfoModel info;
  List<EpisodeModel> results;

  factory EpisodesListModel.fromJson(Map<String, dynamic> json) =>
      EpisodesListModel(
        info: EpisodesInfoModel.fromJson(json["info"]),
        results: List<EpisodeModel>.from(
            json["results"].map((x) => EpisodeModel.fromJson(x))),
      );
}
