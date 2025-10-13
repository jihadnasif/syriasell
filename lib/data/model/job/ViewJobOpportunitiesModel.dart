class ViewJobOpportunitiesModel {
  int? jobId;
  String? companyName;
  String? specialization;
  String? description;
  String? phone;
  String? email;
  String? createdAt;
  String? image;
  int? userId;
  int? addressId;
  String? city;
  String? cityAr;

  ViewJobOpportunitiesModel({
    this.jobId,
    this.companyName,
    this.specialization,
    this.description,
    this.phone,
    this.email,
    this.createdAt,
    this.image,
    this.userId,
    this.addressId,
    this.city,
    this.cityAr,
  });

  ViewJobOpportunitiesModel.fromJson(Map<String, dynamic> json) {
    jobId = json['id'] ?? json['job_id'];
    companyName = json['company_name'];
    specialization = json['specialization'];
    description = json['description'];
    phone = json['phone'];
    email = json['email'];
    createdAt = json['created_at'];
    image = json['image'];
    userId = json['user_id'];
    addressId = json['address_id'];
    city = json['city'];
    cityAr = json['city_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = jobId; // 👈 تأكدنا يرسل بنفس الاسم
    data['company_name'] = companyName;
    data['specialization'] = specialization;
    data['description'] = description;
    data['phone'] = phone;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['image'] = image;
    data['user_id'] = userId;
    data['address_id'] = addressId;
    data['city'] = city;
    data['city_ar'] = cityAr;
    return data;
  }
}
