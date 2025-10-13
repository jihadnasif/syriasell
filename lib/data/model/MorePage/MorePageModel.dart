class MorePageModel {
  int? id;
  String? pageKey;
  String? titleEn;
  String? titleAr;
  String? contentEn;
  String? contentAr;

  MorePageModel(
      {this.id,
      this.pageKey,
      this.titleEn,
      this.titleAr,
      this.contentEn,
      this.contentAr});

  MorePageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageKey = json['page_key'];
    titleEn = json['titleEn'];
    titleAr = json['titleAr'];
    contentEn = json['contentEn'];
    contentAr = json['contentAr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_key'] = this.pageKey;
    data['titleEn'] = this.titleEn;
    data['titleAr'] = this.titleAr;
    data['contentEn'] = this.contentEn;
    data['contentAr'] = this.contentAr;
    return data;
  }
}
