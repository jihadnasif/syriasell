class SliderCompanyModel {
  int? id;
  String? companyName;
  String? imageName;
  String? createdAt;

  SliderCompanyModel({
    this.id,
    this.companyName,
    this.imageName,
    this.createdAt,
  });

  SliderCompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    imageName = json['image_name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    data['image_name'] = this.imageName;
    data['created_at'] = this.createdAt;
    return data;
  }
}
