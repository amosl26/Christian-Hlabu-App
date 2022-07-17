class SawnAwkModel {
  int? id;
  late int pageNumber;
  late String sawnawkNumber;
  late String titleFalam;
  String? titleEnglish;
  late bool bookmark;

  SawnAwkModel(this.id, this.pageNumber, this.sawnawkNumber, this.titleFalam,
      this.titleEnglish, this.bookmark);

  SawnAwkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageNumber = json['pageNumber'];
    sawnawkNumber = json['sawnawkNumber'];
    titleFalam = json['titleFalam'];
    titleEnglish = json['titleEnglish'];
    bookmark = json['bookmark'];
  }
}
