import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/functions/Dialog.dart';
import 'package:syria_sell/core/functions/hindlingData.dart';
import 'package:syria_sell/data/datasource/remote/MorePage/MorePageData.dart';
import 'package:syria_sell/data/model/MorePage/MorePageModel.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/routes.dart';
import '../../core/localization/ChangeLocalController.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/users/userData.dart';
import '../../data/model/userModel.dart';

class MorePageControllerImp extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  goToNewAds() {
    Get.offAllNamed(AppRoute.rAddNewAd);
  }

  goToAddAd() {
    Get.toNamed(AppRoute.rAddNewAd);
  }

  goToHome() {
    Get.toNamed(AppRoute.rHomeUser);
  }

  goToPublishedAds() {
    Get.toNamed(AppRoute.rPublishedAds);
  }

  goToReviewAds() {
    Get.toNamed(AppRoute.rReviewAds);
  }

  goToAbout() {
    Get.toNamed(AppRoute.rAbout);
  }

  goToPrivacy() {
    Get.toNamed(AppRoute.rPrivacy);
  }

  goToTerms() {
    Get.toNamed(AppRoute.rTerms);
  }

  goToSupport() {
    Get.toNamed(AppRoute.rSupport);
  }

  goToChangeLang() {
    Get.toNamed(AppRoute.rChangeLang);
  }

  goToMydata() {
    Get.toNamed(AppRoute.rMydata);
  }

  goToLogOut() {
    showInfoDialog(
      "153".tr,
      "161".tr,
      okButtonText: "156".tr,
      onOkPress: () {
        MyServices myServices = Get.find();
        myServices.sharedPreferences.clear();
        Get.offAllNamed(AppRoute.rBeginning);
      },
      cancelButtonText: "162".tr,
      onCancelPress: () {},
      dialogType: DialogType.warning,
    );
  }

  goToFavorite() {
    Get.toNamed(AppRoute.rFavorite);
  }

  sureDeleteUser() {
    showInfoDialog(
      "153".tr,
      "169".tr,
      okButtonText: "156".tr,
      onOkPress: () {
        deleteUser();
      },
      cancelButtonText: "162".tr,
      onCancelPress: () {},
      dialogType: DialogType.warning,
    );
  }

  deleteUser() async {
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "userId": myServices.sharedPreferences.getInt("idUser").toString(),
    };
    var response = await userData.deleteData(data);
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        myServices.sharedPreferences.clear();
        Get.offAllNamed(AppRoute.rBeginning);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  List listCardMore = [];

  List<MorePageModel> listAbout = [];
  List<MorePageModel> listPrivacy = [];
  List<MorePageModel> listTerms = [];
  List<MorePageModel> listSupport = [];

  MorePageData morePageData = MorePageData(Get.find());

  goToSignIn() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.rSignIn);
  }

  getAbout() async {
    listAbout.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await morePageData.getDataAbout();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listData = response["data"];
        listAbout.addAll(listData.map((e) => MorePageModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getPrivacy() async {
    listPrivacy.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await morePageData.getDataPrivacy();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listData = response["data"];
        listPrivacy.addAll(listData.map((e) => MorePageModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getTerms() async {
    listTerms.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await morePageData.getDataTerms();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listData = response["data"];
        listTerms.addAll(listData.map((e) => MorePageModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getSupport() async {
    listSupport.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await morePageData.getDataSupport();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listData = response["data"];
        listSupport.addAll(listData.map((e) => MorePageModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  var selectedLangIndex = Rxn<int>();
  void changeLang(int index) {
    selectedLangIndex.value = index;
  }

  savedLang() {
    final localController = Get.find<LocalController>();
    if (selectedLangIndex.value == 0) {
      localController.ChangedLanguage("ar");
    } else {
      localController.ChangedLanguage("en");
    }
    update();
    Get.offAllNamed(AppRoute.rHomeUser);
    Get.snackbar("40".tr, "152".tr);
  }

  late TextEditingController contPhon;
  late TextEditingController contEml;
  late TextEditingController contPassword;
  late TextEditingController contName;
  late TextEditingController contConfirmPassword;
  UserData userData = UserData(Get.find());
  List<UserModel> listUser = [];
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isShowPass = true;
  void isShowPassFun() {
    isShowPass = !isShowPass;
    update();
  }

  getUserData() async {
    listUser.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await userData.getData(myServices.sharedPreferences.getInt("idUser")!);
    statusRequest = hindlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responseData = response["data"];
        listUser.addAll(responseData.map((e) => UserModel.fromJson(e)));
        if (listUser.isNotEmpty) {
          contPhon.text = listUser[0].phone ?? "";
          contEml.text = listUser[0].email ?? "";
          contName.text = listUser[0].name ?? "";
          // contPassword.text = listUser[0].password ?? "";
          //  contConfirmPassword.text = listUser[0].password ?? "";
          contPassword.clear();
          contConfirmPassword.clear();
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  editSave() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "userId": myServices.sharedPreferences.getInt("idUser").toString(),
        "userName": contName.text,
        "phone": contPhon.text,
        "email": contEml.text,
        //"password": contPassword.text,
      };
      if (contPassword.text.isNotEmpty) {
        data["password"] = contPassword.text;
      }
      var response = await userData.editData(data);
      statusRequest = hindlingData(response);
      print("------after data------------$response");
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offAllNamed(AppRoute.rSuccessChagedMydata);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    listCardMore = [
      {"func": goToAddAd, "title": "54".tr, "icon": Icons.add},
      {"func": goToPublishedAds, "title": "55".tr, "icon": Icons.person},
      {"func": goToReviewAds, "title": "56".tr, "icon": Icons.north_east},
      {"func": goToFavorite, "title": "57".tr, "icon": Icons.favorite},
      {"func": goToMydata, "title": "59".tr, "icon": Icons.description},
      {"func": goToChangeLang, "title": "60".tr, "icon": Icons.language},
      {"func": goToSupport, "title": "61".tr, "icon": Icons.support_agent},
      {"func": goToAbout, "title": "62".tr, "icon": Icons.info_outline},
      {"func": goToTerms, "title": "63".tr, "icon": Icons.article},
      {"func": goToPrivacy, "title": "64".tr, "icon": Icons.article_outlined},
      {"func": sureDeleteUser, "title": "65".tr, "icon": Icons.person_remove},
      {"func": goToLogOut, "title": "66".tr, "icon": Icons.logout},
    ];
    contPhon = TextEditingController();
    contEml = TextEditingController();
    contPassword = TextEditingController();
    contConfirmPassword = TextEditingController();
    contName = TextEditingController();
    getUserData();
    getAbout();
    getPrivacy();
    getTerms();
    getSupport();
  }

  @override
  void onClose() {
    contPhon.dispose();
    contEml.dispose();
    contPassword.dispose();
    contConfirmPassword.dispose();
    contName.dispose();
    super.onClose();
  }
}
