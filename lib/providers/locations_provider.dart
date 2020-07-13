import 'package:dio/dio.dart';
import 'package:flavors_example/models/characters_endpoint/character_model.dart';
import 'package:flavors_example/models/locations_endpoint/location_model.dart';
import 'package:flavors_example/models/locations_endpoint/locations_list_model.dart';
import 'package:flutter/material.dart';

import '../core/flavors/flavor_config.dart';

class LocationsProvider with ChangeNotifier {
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

  Future<List<LocationModel>> fetchLocations(_) async {
    try {
      _page++;
      if (_isLastPage && _page > 1) {
        return [];
      }
      final url = "${Flavor.server}location/?page=$_page";
      Response response = await dio.get(url);
      LocationsListModel locations = LocationsListModel.fromJson(response.data);
      locations.info.next == null ? _isLastPage = true : _isLastPage = false;
      return locations.results;
    } on DioError catch (err) {
      throw Exception(err);
    }
  }

  Future<LocationModel> fetchLocationsWithCharacters(int id) async {
    try {
      /// [_characters] clear variable and set with new data
      /// referent to character with [id] provided
      _characters.clear();
      final url = "${Flavor.server}location/$id";
      Response response = await dio.get(url);
      LocationModel locations = LocationModel.fromJson(response.data);
      locations.residents.forEach(
        (url) async {
          Response characterRes = await dio.get(url);
          CharacterModel character = CharacterModel.fromJson(characterRes.data);
          _characters.add(character);
          notifyListeners();
        },
      );
      return locations;
    } on DioError catch (err) {
      throw Exception(err);
    }
  }
}
