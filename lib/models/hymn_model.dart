class HymnModel {
  int? id;
  late int pageNumber;
  late String songNumber;
  late String title;
  late String category;

  HymnModel(
      this.id, this.pageNumber, this.songNumber, this.title, this.category);

  HymnModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageNumber = json['pageNumber'];
    songNumber = json['songNumber'];
    title = json['title'];
    category = json['category'];
  }
}
