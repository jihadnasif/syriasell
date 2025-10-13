class CylindersModel {
  int? id;
  String? nameAr;
  String? nameEn;

  CylindersModel({this.id, this.nameAr, this.nameEn});

  CylindersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameAr'] = this.nameAr;
    data['nameEn'] = this.nameEn;
    return data;
  }
}
