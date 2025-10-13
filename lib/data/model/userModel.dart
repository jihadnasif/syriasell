class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  int? verificode;
  int? approve;
  String? creat;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.verificode,
      this.approve,
      this.creat});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    verificode = json['verificode'];
    approve = json['approve'];
    creat = json['creat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['verificode'] = this.verificode;
    data['approve'] = this.approve;
    data['creat'] = this.creat;
    return data;
  }
}
