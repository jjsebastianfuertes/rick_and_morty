import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../core/flavors/flavor_config.dart';
import '../models/characters_endpoint/character_model.dart';
import '../models/episodes_endpoint/episodes_list_model.dart';
import '../models/episodes_endpoint/episodes_model.dart';

class EpisodesProvider with ChangeNotifier {
  final dio = Dio();
  int _page = 0;
  bool _isLastPage = false;
  List<CharacterModel> _characters = [];

  set page(value) {
    _page = value;
  }

  List<CharacterModel> get characters {
    return _characters;
  }

  Future<List<EpisodeModel>> fetchEpisodes(_) async {
    try {
      _page++;
      if (_isLastPage && _page > 1) {
        return [];
      }
      final url = "${Flavor.server}episode/?page=$_page";
      Response response = await dio.get(url);
      EpisodesListModel episodes = EpisodesListModel.fromJson(response.data);
      episodes.info.next == null ? _isLastPage = true : _isLastPage = false;
      return episodes.results;
    } on DioError catch (err) {
      throw Exception(err);
    }
  }

  Future<EpisodeModel> fetchEpisodesWithCharacters(int id) async {
    try {
      /// [_characters] clear variable and set with new data
      /// referent to character with [id] provided
      _characters.clear();
      final url = "${Flavor.server}episode/$id";
      Response response = await dio.get(url);
      EpisodeModel episode = EpisodeModel.fromJson(response.data);
      episode.characters.forEach(
        (url) async {
          Response characterRes = await dio.get(url);
          CharacterModel character = CharacterModel.fromJson(characterRes.data);
          _characters.add(character);
          notifyListeners();
        },
      );
      return episode;
    } on DioError catch (err) {
      throw Exception(err);
    }
  }
}
