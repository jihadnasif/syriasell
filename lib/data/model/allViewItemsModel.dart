class ViewItemsAllModel {
  int? ordersId;
  int? orderStatusCode;
  String? orderStatusName;
  int? userId;
  String? userName;
  String? phone;
  String? email;
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDetails;
  String? itemDetailsAr;
  String? itemStatus;
  int? itemPrice;
  int? itemDiscount;
  int? finalPrice;
  int? itemActive;
  String? imageOne;
  String? imageTwo;
  String? imageThree;
  String? imageFour;
  String? itemCity;
  String? itemArea;
  String? itemCategName;
  String? itemDate;
  int? itemCategorieId;
  String? carKM;
  String? carMakerAr;
  String? transmissionAr;
  String? carCylinderAr;
  String? fuelTypeAr;
  String? engineCapacity;
  String? carColorAr;
  String? carYear;
  String? carMakerEn;
  String? transmissionEn;
  String? carCylinderEn;
  String? fuelTypeEn;
  String? carColorEn;
  String? currencySymbol;

  ViewItemsAllModel(
      {this.ordersId,
      this.orderStatusCode,
      this.orderStatusName,
      this.userId,
      this.userName,
      this.phone,
      this.email,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDetails,
      this.itemDetailsAr,
      this.itemStatus,
      this.itemPrice,
      this.itemDiscount,
      this.finalPrice,
      this.itemActive,
      this.imageOne,
      this.imageTwo,
      this.imageThree,
      this.imageFour,
      this.itemCity,
      this.itemArea,
      this.itemCategName,
      this.itemDate,
      this.itemCategorieId,
      this.carKM,
      this.carMakerAr,
      this.transmissionAr,
      this.carCylinderAr,
      this.fuelTypeAr,
      this.engineCapacity,
      this.carColorAr,
      this.carYear,
      this.carMakerEn,
      this.transmissionEn,
      this.carCylinderEn,
      this.fuelTypeEn,
      this.carColorEn,
      this.currencySymbol});

  ViewItemsAllModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    orderStatusCode = json['order_status_code'];
    orderStatusName = json['order_status_name'];
    userId = json['user_id'];
    userName = json['user_name'];
    phone = json['phone'];
    email = json['email'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDetails = json['item_details'];
    itemDetailsAr = json['item_details_ar'];
    itemStatus = json['item_status'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    finalPrice = json['final_price'];
    itemActive = json['item_active'];
    imageOne = json['imageOne'];
    imageTwo = json['imageTwo'];
    imageThree = json['imageThree'];
    imageFour = json['imageFour'];
    itemCity = json['item_city'];
    itemArea = json['item_area'];
    itemCategName = json['item_categ_Name'];
    itemDate = json['item_date'];
    itemCategorieId = json['item_categorie_id'];
    carKM = json['car_kM'];
    carMakerAr = json['car_maker_ar'];
    transmissionAr = json['transmission_ar'];
    carCylinderAr = json['car_cylinder_ar'];
    fuelTypeAr = json['fuel_type_ar'];
    engineCapacity = json['engine_capacity'];
    carColorAr = json['car_color_ar'];
    carYear = json['car_year'];
    carMakerEn = json['car_maker_en'];
    transmissionEn = json['transmission_en'];
    carCylinderEn = json['car_cylinder_en'];
    fuelTypeEn = json['fuel_type_en'];
    carColorEn = json['car_color_en'];
    currencySymbol = json['currency_symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['order_status_code'] = this.orderStatusCode;
    data['order_status_name'] = this.orderStatusName;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_name_ar'] = this.itemNameAr;
    data['item_details'] = this.itemDetails;
    data['item_details_ar'] = this.itemDetailsAr;
    data['item_status'] = this.itemStatus;
    data['item_price'] = this.itemPrice;
    data['item_discount'] = this.itemDiscount;
    data['final_price'] = this.finalPrice;
    data['item_active'] = this.itemActive;
    data['imageOne'] = this.imageOne;
    data['imageTwo'] = this.imageTwo;
    data['imageThree'] = this.imageThree;
    data['imageFour'] = this.imageFour;
    data['item_city'] = this.itemCity;
    data['item_area'] = this.itemArea;
    data['item_categ_Name'] = this.itemCategName;
    data['item_date'] = this.itemDate;
    data['item_categorie_id'] = this.itemCategorieId;
    data['car_kM'] = this.carKM;
    data['car_maker_ar'] = this.carMakerAr;
    data['transmission_ar'] = this.transmissionAr;
    data['car_cylinder_ar'] = this.carCylinderAr;
    data['fuel_type_ar'] = this.fuelTypeAr;
    data['engine_capacity'] = this.engineCapacity;
    data['car_color_ar'] = this.carColorAr;
    data['car_year'] = this.carYear;
    data['car_maker_en'] = this.carMakerEn;
    data['transmission_en'] = this.transmissionEn;
    data['car_cylinder_en'] = this.carCylinderEn;
    data['fuel_type_en'] = this.fuelTypeEn;
    data['car_color_en'] = this.carColorEn;
    data['currency_symbol'] = this.currencySymbol;
    return data;
  }
}
