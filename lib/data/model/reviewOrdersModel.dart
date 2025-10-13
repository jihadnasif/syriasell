class OrdersModel {
  int? ordersId;
  int? orderStatusCode;
  String? orderStatusName;
  int? userId;
  String? userName;
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

  OrdersModel({
    this.ordersId,
    this.orderStatusCode,
    this.orderStatusName,
    this.userId,
    this.userName,
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
  });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    orderStatusCode = json['order_status_code'];
    orderStatusName = json['order_status_name'];
    userId = json['user_id'];
    userName = json['user_name'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['order_status_code'] = this.orderStatusCode;
    data['order_status_name'] = this.orderStatusName;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
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
    return data;
  }
}
