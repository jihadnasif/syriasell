class EngineCapacityModel {
  int? id;
  String? capacity;

  EngineCapacityModel({this.id, this.capacity});

  EngineCapacityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    capacity = json['capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['capacity'] = this.capacity;
    return data;
  }
}
