class ViewFavoriteModel {
  int? favoriteId;
  int? favoriteUsersid;
  int? favoriteItemsid;
  int? itemId;
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
  int? makerCarId;
  int? transmissionCarId;
  int? cylinderCarId;
  int? fuelCarId;
  int? engineCapacityCarId;
  int? colorId;
  int? yearId;
  String? carKM;
  String? currencySymbol;

  ViewFavoriteModel(
      {this.favoriteId,
      this.favoriteUsersid,
      this.favoriteItemsid,
      this.itemId,
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
      this.itemUserId,
      this.makerCarId,
      this.transmissionCarId,
      this.cylinderCarId,
      this.fuelCarId,
      this.engineCapacityCarId,
      this.colorId,
      this.yearId,
      this.carKM,
      this.currencySymbol});

  ViewFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteItemsid = json['favorite_itemsid'];
    itemId = json['item_id'];
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
    makerCarId = json['maker_car_id'];
    transmissionCarId = json['transmission_car_id'];
    cylinderCarId = json['cylinder_car_id'];
    fuelCarId = json['fuel_car_id'];
    engineCapacityCarId = json['engine_capacity_car_id'];
    colorId = json['color_id'];
    yearId = json['year_id'];
    carKM = json['car_kM'];
    currencySymbol = json['currency_symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['favorite_itemsid'] = this.favoriteItemsid;
    data['item_id'] = this.itemId;
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
    data['maker_car_id'] = this.makerCarId;
    data['transmission_car_id'] = this.transmissionCarId;
    data['cylinder_car_id'] = this.cylinderCarId;
    data['fuel_car_id'] = this.fuelCarId;
    data['engine_capacity_car_id'] = this.engineCapacityCarId;
    data['color_id'] = this.colorId;
    data['year_id'] = this.yearId;
    data['car_kM'] = this.carKM;
    data['currency_symbol'] = this.currencySymbol;
    return data;
  }
}
