class ViewJobAppModel {
  int? jobId;
  String? fullName;
  String? specialization;
  String? description;
  String? phoneNumber;
  String? email;
  String? createdAt;
  int? yearsOfExperience;
  int? userId;
  int? addressId;
  String? city;
  String? cityAr;

  ViewJobAppModel(
      {this.jobId,
      this.fullName,
      this.specialization,
      this.description,
      this.phoneNumber,
      this.email,
      this.createdAt,
      this.yearsOfExperience,
      this.userId,
      this.addressId,
      this.city,
      this.cityAr});

  ViewJobAppModel.fromJson(Map<String, dynamic> json) {
    jobId = json['id'] ?? json['job_id'];
    fullName = json['full_name'];
    specialization = json['specialization'];
    description = json['description'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    createdAt = json['created_at'];
    yearsOfExperience = json['years_of_experience'];
    userId = json['user_id'];
    addressId = json['address_id'];
    city = json['city'];
    cityAr = json['city_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.jobId;
    data['full_name'] = this.fullName;
    data['specialization'] = this.specialization;
    data['description'] = this.description;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['years_of_experience'] = this.yearsOfExperience;
    data['user_id'] = this.userId;
    data['address_id'] = this.addressId;
    data['city'] = this.city;
    data['city_ar'] = this.cityAr;
    return data;
  }
}
