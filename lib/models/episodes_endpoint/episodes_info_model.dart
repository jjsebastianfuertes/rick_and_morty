class EpisodesInfoModel {
  EpisodesInfoModel({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  int count;
  int pages;
  String next;
  dynamic prev;

  factory EpisodesInfoModel.fromJson(Map<String, dynamic> json) =>
      EpisodesInfoModel(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );
}
