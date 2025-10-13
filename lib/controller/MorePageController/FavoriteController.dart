import 'package:get/get.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/hindlingData.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/Favorite/viewAndDeletFavoriteData.dart';
import '../../data/datasource/remote/jobs/FavoriteAllAppData.dart';
import '../../data/datasource/remote/jobs/FavoriteAllOppData.dart';
import '../../data/model/FavoriteModel.dart';
import '../../data/model/job/ViewJobAppModel.dart';
import '../../data/model/job/ViewJobOpportunitiesModel.dart';

class FavoriteControllerImp extends GetxController {
  List<ViewFavoriteModel> data = [];
  List<ViewJobOpportunitiesModel> dataOpp = [];
  List<ViewJobAppModel> dataApp = [];

  late StatusRequest statusRequest;
  ViewFavoriteData favoriteData = ViewFavoriteData(Get.find());
  ViewFavoriteJobOppData favoriteJobOppData =
      ViewFavoriteJobOppData(Get.find());
  FavoriteAllJobAppData favoriteJobAppData = FavoriteAllJobAppData(Get.find());

  MyServices myServices = Get.find();

  getMyViewFavorite() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData
        .getViewFavorite(myServices.sharedPreferences.getInt("idUser")!);
    statusRequest = hindlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        // البيانات من الداتا تأتي على شكل ليست
        List responseData = response["data"];
        data.addAll(responseData.map((e) => ViewFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getMyViewFavoriteOpp() async {
    dataOpp.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await favoriteJobOppData
        .getViewFavorite(myServices.sharedPreferences.getInt("idUser")!);

    statusRequest = hindlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responseData = response["data"];
        dataOpp.addAll(
            responseData.map((e) => ViewJobOpportunitiesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getMyViewFavoriteApp() async {
    dataApp.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await favoriteJobAppData
        .getViewFavorite(myServices.sharedPreferences.getInt("idUser")!);

    statusRequest = hindlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responseData = response["data"];
        dataApp.addAll(responseData.map((e) => ViewJobAppModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFavorite(int favoriteId) {
    data.clear();
    statusRequest = StatusRequest.loading;
    data.removeWhere((element) => element.favoriteId == favoriteId);
    update();
  }

  deleteFavoriteOpp(int favoriteId) {
    dataOpp.removeWhere((element) => element.jobId == favoriteId);
    update();
  }

  deleteFavoriteApp(int favoriteId) {
    dataApp.removeWhere((element) => element.jobId == favoriteId);
    update();
  }

  goToItemDetails(String itemid) async {
    var result = await Get.toNamed(
      AppRoute.rItemDetails,
      arguments: {"itemsId": itemid},
    );
    if (result == true) {
      getMyViewFavorite();
      update();
    }
  }

  goToItemDetailsOpp(int jobId) async {
    var result = await Get.toNamed(
      AppRoute.rJobOpportunityDetails,
      arguments: {"jobId": jobId},
    );
    if (result == true) {
      getMyViewFavoriteOpp();
      update();
    }
  }

  goToItemDetailsApp(int jobId) async {
    var result = await Get.toNamed(
      AppRoute.rJobApplicationDetails,
      arguments: {"jobId": jobId},
    );

    if (result == true) {
      getMyViewFavoriteApp();
      update();
    }
  }

  refreshData() async {
    await getMyViewFavorite();
    await getMyViewFavoriteOpp();
    await getMyViewFavoriteApp();
  }

  @override
  void onInit() async {
    await refreshData();
    super.onInit();
  }
}
