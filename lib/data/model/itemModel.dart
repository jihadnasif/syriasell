class ItemsModel {
  int? id;
  String? name;
  String? nameAr;
  String? details;
  String? detailsAr;
  int? price;
  String? itemCity;
  String? itemStatus;
  String? itemArea;
  String? imageOne;
  String? imageTwo;
  String? imageThree;
  String? imageFour;
  int? count;
  int? active;
  int? discount;
  String? date;
  String? itemCategName;
  int? itemCategorieId;
  int? itemCityId;
  int? itemStatusId;
  int? itemUserId;

  ItemsModel(
      {this.id,
      this.name,
      this.nameAr,
      this.details,
      this.detailsAr,
      this.price,
      this.itemCity,
      this.itemStatus,
      this.itemArea,
      this.imageOne,
      this.imageTwo,
      this.imageThree,
      this.imageFour,
      this.count,
      this.active,
      this.discount,
      this.date,
      this.itemCategName,
      this.itemCategorieId,
      this.itemCityId,
      this.itemStatusId,
      this.itemUserId});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    details = json['details'];
    detailsAr = json['details_ar'];
    price = json['price'];
    itemCity = json['item_city'];
    itemStatus = json['item_status'];
    itemArea = json['item_area'];
    imageOne = json['imageOne'];
    imageTwo = json['imageTwo'];
    imageThree = json['imageThree'];
    imageFour = json['imageFour'];
    count = json['count'];
    active = json['active'];
    discount = json['discount'];
    date = json['date'];
    itemCategName = json['item_categ_Name'];
    itemCategorieId = json['item_categorie_id'];
    itemCityId = json['item_city_id'];
    itemStatusId = json['item_status_id'];
    itemUserId = json['item_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['details'] = this.details;
    data['details_ar'] = this.detailsAr;
    data['price'] = this.price;
    data['item_city'] = this.itemCity;
    data['item_status'] = this.itemStatus;
    data['item_area'] = this.itemArea;
    data['imageOne'] = this.imageOne;
    data['imageTwo'] = this.imageTwo;
    data['imageThree'] = this.imageThree;
    data['imageFour'] = this.imageFour;
    data['count'] = this.count;
    data['active'] = this.active;
    data['discount'] = this.discount;
    data['date'] = this.date;
    data['item_categ_Name'] = this.itemCategName;
    data['item_categorie_id'] = this.itemCategorieId;
    data['item_city_id'] = this.itemCityId;
    data['item_status_id'] = this.itemStatusId;
    data['item_user_id'] = this.itemUserId;
    return data;
  }
}
