class CityModel {
  int? id;
  String? city;
  String? cityAr;
  String? date;

  CityModel({this.id, this.city, this.cityAr, this.date});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    cityAr = json['city_ar'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city'] = this.city;
    data['city_ar'] = this.cityAr;
    data['date'] = this.date;
    return data;
  }
}
