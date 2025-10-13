import 'package:get/get.dart';
import 'package:syria_sell/core/class/StatusRequest.dart';
import 'package:syria_sell/core/constant/routes.dart';

import '../../core/functions/hindlingData.dart';
import '../../data/datasource/remote/Items/itemsCategoryId.dart';
import '../../data/model/allViewItemsModel.dart';

class ItemCategoryIdController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  late int categid;
  late String categName;
  late String imagePath;

  ItemsCategoryIdData itemsCategoryIdData = ItemsCategoryIdData(Get.find());
  ViewItemsAllModel? viewItemsAllModel;
  List<ViewItemsAllModel> listItemsCategId = [];

  getItemsCategoryId() async {
    listItemsCategId.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsCategoryIdData
        .getItemsCategId({"categid": categid.toString()});
    statusRequest = hindlingData(response);
    print(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success" && response["data"].isNotEmpty) {
        viewItemsAllModel = ViewItemsAllModel.fromJson(response["data"][0]);
        if (response["status"] == "success") {
          List listData = response["data"];
          listItemsCategId
              .addAll(listData.map((e) => ViewItemsAllModel.fromJson(e)));
        }
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
    categid = Get.arguments['categid'];
    categName = Get.arguments['categName'];
    imagePath = Get.arguments['imagePath'];
    getItemsCategoryId();
  }

  @override
  void onInit() {
    super.onInit();
    categid = Get.arguments['categid'];
    categName = Get.arguments['categName'];
    imagePath = Get.arguments['imagePath'];
    print("*****************");
    print(imagePath);
    print("*****************");
    getItemsCategoryId();
    print("*******$categid********");
  }
}
