class LocationsInfoModel {
  LocationsInfoModel({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  int count;
  int pages;
  String next;
  dynamic prev;

  factory LocationsInfoModel.fromJson(Map<String, dynamic> json) =>
      LocationsInfoModel(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );
}
