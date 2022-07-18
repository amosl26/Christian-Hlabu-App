class HymnModel {
  int? id;
  late int pageNumber;
  late String songNumber;
  late String title;
  String? category;
  late bool bookmark;

  HymnModel(this.id, this.pageNumber, this.songNumber, this.title,
      this.category, this.bookmark);

  HymnModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageNumber = json['pageNumber'];
    songNumber = json['songNumber'];
    title = json['title'];
    category = json['category'];
    bookmark = json['bookmark'];
  }
}
