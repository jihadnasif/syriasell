import '../../../../LinkApp.dart';
import '../../../../core/class/CRUD.dart';

class OrderData {
  CRUD crud;
  OrderData(this.crud);
  getDataReviewOrders(Map data) async {
    var response = await crud.postData(LinkApp.viewReviewOrders, data);
    return response.fold((l) => l, (r) => r);
  }

  getDataPublishedOrders(Map data) async {
    var response = await crud.postData(LinkApp.viewPublishedOrders, data);
    return response.fold((l) => l, (r) => r);
  }

  deleteOrder(Map data) async {
    var response = await crud.postData(LinkApp.deleteOrder, data);
    return response.fold((l) => l, (r) => r);
  }
}
