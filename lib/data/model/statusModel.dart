class StatusModel {
  int? id;
  String? status;
  String? statusAr;
  String? date;

  StatusModel({this.id, this.status, this.statusAr, this.date});

  StatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    statusAr = json['status_ar'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['status_ar'] = this.statusAr;
    data['date'] = this.date;
    return data;
  }
}
