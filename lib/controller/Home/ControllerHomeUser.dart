import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/constant/routes.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/functions/hindlingData.dart';
import '../../data/datasource/remote/CompanySlider/SliderCompanyData.dart';
import '../../data/datasource/remote/Items/itemData.dart';
import '../../data/datasource/remote/categories/categoriesData.dart';
import '../../data/model/CompanySlider/sliderCompany.dart';
import '../../data/model/allViewItemsModel.dart';
import '../../data/model/categoriesModel.dart';

abstract class ControllerHomeUser extends GetxController {}

class ControllerHomeUserImp extends SearchMixController {
  StatusRequest statusRequest = StatusRequest.none;

  var items = [];

  List<CategoriesModel> listCateg = [];

  goToNewAds() {
    Get.offAllNamed(AppRoute.rAddNewAd);
  }

  getCategoreis() async {
    CategoriesData categData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await categData.getData();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listRespo = response["data"];
        listCateg.addAll(listRespo.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToItemsCategId(int categid, String categName, String imagePath) {
    Get.toNamed(
      AppRoute.rItemsCategId,
      arguments: {
        "categid": categid,
        "categName": categName,
        "imagePath": imagePath
      },
    );
  }

  goToItemDetails(String itemid) async {
    await Get.toNamed(
      AppRoute.rItemDetails,
      arguments: {"itemsId": itemid},
    );
  }

  SlidersCompanyData slidersCompanyData = SlidersCompanyData(Get.find());
  List<SliderCompanyModel> listSliders = [];

  getSliderCompany() async {
    listSliders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await slidersCompanyData.getSlidersCompany();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listRespo = response["data"];
        listSliders.addAll(
          listRespo.map((e) => SliderCompanyModel.fromJson(e)),
        );
        print("***************");
        print(listSliders[0]);
        print("***************");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  /// دالة لتحديث البيانات عند سحب الشاشة للأسفل
  Future<void> refreshData() async {
    // يمكن وضع await إذا كانت الدوال async
    await getCategoreis();
    await getSliderCompany();
  }

  @override
  void onInit() {
    super.onInit();
    getCategoreis();
    getSliderCompany();
  }
}

///////////////////////////
class SearchMixController extends GetxController {
  TextEditingController? searchController;
  FocusNode searchFocus = FocusNode(); // ✅ تعديل 1: إضافة FocusNode
  bool isSearch = false;
  List<ViewItemsAllModel> listItemsSearch = [];
  late StatusRequest statusRequest;

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
      statusRequest = StatusRequest.none;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    getSearchData();
    update();
  }

  getSearchData() async {
    statusRequest = StatusRequest.loading;
    ItemsData itemsData = ItemsData(Get.find());
    var response = await itemsData.searchData(searchController!.text);
    statusRequest = hindlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        listItemsSearch.clear();
        List responseData = response["data"];
        listItemsSearch.addAll(
          responseData.map((e) => ViewItemsAllModel.fromJson(e)),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  List<ViewItemsAllModel> suggestions = [];

  Future<void> getSuggestions(String query) async {
    if (query.isEmpty) {
      suggestions.clear();
      update();
      return;
    }

    ItemsData itemsData = ItemsData(Get.find());
    var response = await itemsData.searchData(query);

    if (response is Map && response["status"] == "success") {
      List responseData = response["data"];
      suggestions =
          responseData.map((e) => ViewItemsAllModel.fromJson(e)).toList();
      print("✅ -------------suggestions loaded: ${suggestions.length}");
    } else {
      print("❌ -------------Unexpected response: $response");
      suggestions.clear();
    }
    update();
  }
}
