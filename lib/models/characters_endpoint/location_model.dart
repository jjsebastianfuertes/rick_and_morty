class LocationModel {
  LocationModel({
    this.name,
    this.url,
  });

  String name;
  String url;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        name: json["name"],
        url: json["url"],
      );
}
