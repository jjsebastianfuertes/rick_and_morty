class CharacterInfoModel {
  CharacterInfoModel({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  int count;
  int pages;
  String next;
  dynamic prev;

  factory CharacterInfoModel.fromJson(Map<String, dynamic> json) =>
      CharacterInfoModel(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );
}
