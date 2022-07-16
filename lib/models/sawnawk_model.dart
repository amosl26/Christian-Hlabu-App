class SawnAwkModel {
  int? id;
  late int pageNumber;
  late String titleFalam;
  String? titleEnglish;
  bool? favorite;

  SawnAwkModel(this.id, this.pageNumber, this.titleFalam, this.titleEnglish,
      this.favorite);

  SawnAwkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageNumber = json['pageNumber'];
    titleFalam = json['titleFalam'];
    titleEnglish = json['titleEnglish'];
    favorite = json['favorite'];
  }
}
