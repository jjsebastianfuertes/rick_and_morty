import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../core/flavors/flavor_config.dart';
import '../models/characters_endpoint/character_list_model.dart';
import '../models/characters_endpoint/character_model.dart';
import '../models/episodes_endpoint/episodes_model.dart';

class CharacterProvider with ChangeNotifier {
  final dio = Dio();
  int _page = 0;

  set page(value) {
    _page = value;
  }

  bool _isLastPage = false;
  List<EpisodeModel> _episodes = [];

  List<EpisodeModel> get episodes {
    return _episodes;
  }

  Future<List<CharacterModel>> fetchCharacters(_) async {
    try {
      _page++;
      if (_isLastPage && _page > 1) {
        return [];
      }
      final url = "${Flavor.server}character/?page=$_page";
      Response response = await dio.get(url);
      CharacterListModel characters =
          CharacterListModel.fromJson(response.data);
      characters.info.next == null ? _isLastPage = true : _isLastPage = false;
      return characters.results;
    } on DioError catch (err) {
      throw Exception(err);
    }
  }

  Future<CharacterModel> fetchCharacterWithEpisodes(int id) async {
    try {
      /// [_episodes] clear variable and set with new data
      /// referent to character with [id] provided
      _episodes.clear();
      final url = "${Flavor.server}character/$id";
      Response response = await dio.get(url);
      CharacterModel character = CharacterModel.fromJson(response.data);
      character.episode.forEach(
        (url) async {
          Response episodeRes = await dio.get(url);
          EpisodeModel episode = EpisodeModel.fromJson(episodeRes.data);
          _episodes.add(episode);
          notifyListeners();
        },
      );
      return character;
    } on DioError catch (err) {
      throw Exception(err);
    }
  }
}
