import './location_model.dart';
import './locations_info_model.dart';

class LocationsListModel {
  LocationsListModel({
    this.info,
    this.results,
  });

  LocationsInfoModel info;
  List<LocationModel> results;

  factory LocationsListModel.fromJson(Map<String, dynamic> json) =>
      LocationsListModel(
        info: LocationsInfoModel.fromJson(json["info"]),
        results: List<LocationModel>.from(
            json["results"].map((x) => LocationModel.fromJson(x))),
      );
}
