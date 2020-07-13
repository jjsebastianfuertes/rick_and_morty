import './character_info_model.dart';
import './character_model.dart';

class CharacterListModel {
  CharacterListModel({
    this.info,
    this.results,
  });

  CharacterInfoModel info;
  List<CharacterModel> results;

  factory CharacterListModel.fromJson(Map<String, dynamic> json) =>
      CharacterListModel(
        info: CharacterInfoModel.fromJson(json["info"]),
        results: List<CharacterModel>.from(
            json["results"].map((x) => CharacterModel.fromJson(x))),
      );
}
