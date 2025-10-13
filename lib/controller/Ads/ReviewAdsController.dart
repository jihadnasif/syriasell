import 'package:get/get.dart';
import 'package:syria_sell/core/constant/routes.dart';
import 'package:syria_sell/core/functions/hindlingData.dart';
import 'package:syria_sell/core/services/services.dart';
import 'package:syria_sell/data/datasource/remote/orders/orderData.dart';
import 'package:syria_sell/data/model/reviewOrdersModel.dart';

import '../../core/class/StatusRequest.dart';

abstract class ReviewAdsController extends GetxController {}

class ReviewAdsControllerImp extends ReviewAdsController {
  StatusRequest statusRequest = StatusRequest.none;
  goToNewAds() {
    Get.offAllNamed(AppRoute.rAddNewAd);
  }

  goToReviewAds() {
    Get.toNamed(AppRoute.rReviewAds);
  }

  goToPublishedAds() {
    Get.toNamed(AppRoute.rPublishedAds);
  }

  goToMyOppJobs() {
    Get.toNamed(AppRoute.rMyOppjobs);
  }

  goToMyAppJobs() {
    Get.toNamed(AppRoute.rMyApplicationjobs);
  }

  goToAddAd() {
    Get.toNamed(AppRoute.rAddNewAd);
  }

  List<OrdersModel> listReviewOrders = [];
  OrderData orderData = OrderData(Get.find());
  MyServices myServices = Get.find();

  getReviewOrders() async {
    listReviewOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderData.getDataReviewOrders({
      "userid": myServices.sharedPreferences.getInt("idUser").toString(),
    });
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listData = response["data"];
        listReviewOrders.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrder() {
    getReviewOrders();
  }

  deleteOrder(Map dataap) async {
    listReviewOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderData.deleteOrder(dataap);
    statusRequest = hindlingData(response);
    print("------after data------------${response}");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        refreshOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToItemDetails(String itemid) async {
    await Get.toNamed(
      AppRoute.rItemDetails,
      arguments: {"itemsId": itemid},
    );
  }

  Future<void> refreshData() async {
    getReviewOrders();
  }

  @override
  void onInit() {
    super.onInit();
    getReviewOrders();
  }
}
