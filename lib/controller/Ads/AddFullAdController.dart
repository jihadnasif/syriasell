import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syria_sell/core/constant/routes.dart';
import 'package:syria_sell/core/functions/ArabicToEnglish.dart';
import 'package:syria_sell/core/functions/Dialog.dart';
import 'package:syria_sell/core/functions/hindlingData.dart';
import 'package:syria_sell/core/functions/translateDataBase.dart';
import 'package:syria_sell/core/functions/uploadFile.dart';
import 'package:syria_sell/core/services/services.dart';
import 'package:syria_sell/data/datasource/remote/Items/StatusData.dart';
import 'package:syria_sell/data/datasource/remote/Items/itemData.dart';
import 'package:syria_sell/data/datasource/remote/address/cityData.dart';
import 'package:syria_sell/data/datasource/remote/categories/categoriesData.dart';
import 'package:syria_sell/data/datasource/remote/users/userData.dart';
import 'package:syria_sell/data/model/categoriesModel.dart';
import 'package:syria_sell/data/model/cityModel.dart';
import 'package:syria_sell/data/model/statusModel.dart';
import 'package:syria_sell/data/model/userModel.dart';

import '../../core/class/StatusRequest.dart';
import '../../data/datasource/remote/currency/currencyData.dart';
import '../../data/model/currencyModel/CurrencyModel.dart';
import '../car/SelectedCarController.dart';

abstract class AddAdFullController extends GetxController {}

class AddAdFullControllerImp extends AddAdFullController {
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = Get.find();

  // --- Step 1: بيانات الإعلان ---
  GlobalKey<FormState> formStep1Key = GlobalKey<FormState>();
  late TextEditingController contAdsName;
  late TextEditingController contAdsDesc;
  late TextEditingController contAdsPrice;

  List<File?> images = [null, null, null, null]; // الصورة الأولى إلزامية
  List<Uint8List?> webImagesBytes = [null, null, null, null];
  List<String?> webFileNames = [null, null, null, null];
  final ImagePicker _picker = ImagePicker();

  bool isOnNegotiable = false;
  bool isOnChatApp = false;
  bool isOnMobile = false;
  bool isOnWhatsApp = false;
  bool isOnOptiBuy = false;

  // --- Dropdown Controllers ---
  late TextEditingController categName;
  late TextEditingController categId;
  late TextEditingController statusName;
  late TextEditingController statusId;
  late TextEditingController cityName;
  late TextEditingController cityId;
  late TextEditingController currencyName;
  late TextEditingController currencyId;
  List<SelectedListItem> listSelectedCategory = [];
  List<SelectedListItem> listSelectedStatus = [];
  List<SelectedListItem> listSelectedCity = [];
  List<SelectedListItem> listSelectedCurrency = [];
  UserData userData = UserData(Get.find());
  UserModel? userModel;
  List<UserModel> listUserModel = [];

  //---------------getCategoreis------------------
  getCategoreis() async {
    CategoriesData categData = CategoriesData(Get.find());

    statusRequest = StatusRequest.loading;
    update();
    var response = await categData.getData();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List<CategoriesModel> listCateg = [];
        List listRespo = response["data"];
        listCateg.addAll(listRespo.map((e) => CategoriesModel.fromJson(e)));

        for (int i = 0; i < listCateg.length; i++) {
          listSelectedCategory.add(
            SelectedListItem(
              name: translateDataBase(listCateg[i].name!, listCateg[i].nameAr!),
              value: listCateg[i].id!.toString(),
            ),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  //---------------getStatus------------------
  getStatus() async {
    StatusData statusData = StatusData(Get.find());

    statusRequest = StatusRequest.loading;
    update();
    var response = await statusData.getData();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List<StatusModel> listStatus = [];
        List listRespo = response["data"];
        listStatus.addAll(listRespo.map((e) => StatusModel.fromJson(e)));

        for (int i = 0; i < listStatus.length; i++) {
          listSelectedStatus.add(
            SelectedListItem(
              name: translateDataBase(
                  listStatus[i].status!, listStatus[i].statusAr!),
              value: listStatus[i].id!.toString(),
            ),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  //---------------getCity------------------
  getCity() async {
    CityData cityData = CityData(Get.find());

    statusRequest = StatusRequest.loading;
    update();
    var response = await cityData.getData();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List<CityModel> listCity = [];
        List listRespo = response["data"];
        listCity.addAll(listRespo.map((e) => CityModel.fromJson(e)));

        for (int i = 0; i < listCity.length; i++) {
          listSelectedCity.add(
            SelectedListItem(
              name: translateDataBase(listCity[i].city!, listCity[i].cityAr!),
              value: listCity[i].id!.toString(),
            ),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  //---------------getUser------------------

  getUser() async {
    statusRequest = StatusRequest.loading;
    var response =
        await userData.getData(myServices.sharedPreferences.getInt("idUser")!);
    statusRequest = hindlingData(response);
    print("------////////------------${response}");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responseData = response["data"];
        listUserModel.addAll(responseData.map((e) => UserModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  //------------------price-----------
  getCurrency() async {
    CurrencyData currencyData = CurrencyData(Get.find());

    statusRequest = StatusRequest.loading;
    update();
    var response = await currencyData.getDataCurrency();
    statusRequest = hindlingData(response);
    print("------after data------------$response");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List<ViewCurrencyModel> listCurrency = [];
        List listRespo = response["data"];
        listCurrency
            .addAll(listRespo.map((e) => ViewCurrencyModel.fromJson(e)));

        for (int i = 0; i < listCurrency.length; i++) {
          listSelectedCurrency.add(
            SelectedListItem(
              name: translateDataBase(listCurrency[i].currencySymbol,
                  listCurrency[i].currencySymbol),
              value: listCurrency[i].id.toString(),
            ),
          );
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // Step 2
  GlobalKey<FormState> formStep2Key = GlobalKey<FormState>();
  late TextEditingController contAdsArea;

  // --- Toggle switches ---
  void toggleNegotiable() => isOnNegotiable = !isOnNegotiable;
  void toggleChatApp() => isOnChatApp = !isOnChatApp;
  void toggleMobile() => isOnMobile = !isOnMobile;
  void toggleWhatsApp() => isOnWhatsApp = !isOnWhatsApp;
  void toggleOptiBuy() => isOnOptiBuy = !isOnOptiBuy;

  // --- Image selection ---
//  optionImage(int index) => showBottomMenu(imageCamera, imageGallery, index);
  optionImage(int index) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Wrap(
          children: [
            if (!kIsWeb)
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("135".tr),
                onTap: () {
                  Get.back();
                  imageCamera(index);
                },
              ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("136".tr),
              onTap: () {
                Get.back();
                imageGallery(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  imageCamera(int index) async {
    if (kIsWeb) {
      Get.snackbar("153".tr, "212".tr);
      return;
    }
    File? picked = await imageUploadCamera();
    if (picked != null) {
      images[index] = picked;
      update();
    }
  }

  imageGallery(int index) async {
    if (kIsWeb) {
      // 📱 على الويب
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        webFileNames[index] = pickedFile.name;
        webImagesBytes[index] = (await pickedFile.readAsBytes()) as Uint8List?;
        images[index] = null; // لأننا على الويب لا نستخدم File
        update();
      }
    } else {
      File? picked = await fileUploadGallery();
      if (picked != null) {
        images[index] = picked;
        update();
      }
    }
  }

  // --- Step1 validation and continue to step2 ---
  addAndContinue() {
    if (formStep1Key.currentState!.validate()) {
      if (images[0] == null && webImagesBytes[0] == null) {
        return Get.snackbar("153".tr, "154".tr);
      }
      // الصور والقيم محفوظة في الكونترولر
      Get.toNamed(AppRoute.rAddAd);
    }
  }

  // --- Add full ad ---
  addAd() async {
    if (formStep2Key.currentState!.validate()) {
      if (images[0] == null && webImagesBytes[0] == null) {
        return Get.snackbar("153".tr, "154".tr);
      }

      statusRequest = StatusRequest.loading;
      update();
      SelectedCarController carController = Get.find<SelectedCarController>();
      Map<String, dynamic> data = {
        "namAr": contAdsName.text,
        "detailsAr": contAdsDesc.text,
        "price": convertArabicToEnglishDigits(contAdsPrice.text),
        "itemcategId": categId.text,
        "itemcategName": categName.text,
        "itemStatusId": statusId.text,
        "itemStatusName": statusName.text,
        "itemCityId": cityId.text,
        "itemCityName": cityName.text,
        "itemArea": contAdsArea.text,
        "itemdateTime": DateTime.now().toString(),
        "itemuserid": myServices.sharedPreferences.getInt("idUser"),
        "currencyId": currencyId.text,
      };

// إذا كانت الفئة سيارات فقط أضف بيانات السيارة
      if (categName.text.toLowerCase() == "Cars" ||
          categName.text.toLowerCase() == "سيارات") {
        final carData = {
          "carMakersId": carController.carMakersId?.text,
          "carTransmissionId": carController.carTransmissionId?.text,
          "carCylindersId": carController.carCylindersId?.text,
          "carFuelId": carController.carFuelId?.text,
          "carEngineCapacityId": carController.carEngineCapacityId?.text,
          "carColorsId": carController.carColorsId?.text,
          "carYearsId": carController.carYearsId?.text,
          "kM": carController.contKM?.text,
        };

        // إزالة الحقول الفارغة قبل الإضافة
        carData.removeWhere((key, value) => value == null || value.isEmpty);

        data.addAll(carData);
      }

      print("------ البيانات المرسلة ------------");
      print(data);

      dynamic response;
      if (kIsWeb) {
        response = await itemsData.addDataWeb(
          data,
          webImagesBytes[0]!,
          imageTwo: webImagesBytes[1],
          imageThree: webImagesBytes[2],
          imageFour: webImagesBytes[3],
        );
      } else {
        response = await itemsData.addData(
          data,
          images[0]!,
          imageTwo: images[1],
          imageThree: images[2],
          imageFour: images[3],
        );
      }

      statusRequest = hindlingData(response);
      print("------ رد السيرفر ------------");
      print(response);

      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          statusRequest = StatusRequest.loading;
          showInfoDialog(
            "155".tr,
            "157".tr,
            dialogType: DialogType.success,
            okButtonText: "156".tr,
            onOkPress: () {
              Get.offAllNamed(AppRoute.rHomeUser);
            },
          );
        } else {
          statusRequest = StatusRequest.failure;
          Get.snackbar("32".tr, "158".tr);
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCategoreis();
    getStatus();
    getCity();
    getUser();
    getCurrency();
    print("---------1ffs----------");
    // Step1
    contAdsName = TextEditingController();
    contAdsDesc = TextEditingController();
    contAdsPrice = TextEditingController();

    // Step2
    contAdsArea = TextEditingController();

    // categories

    categName = TextEditingController();
    categId = TextEditingController();
    statusName = TextEditingController();
    statusId = TextEditingController();
    cityName = TextEditingController();
    cityId = TextEditingController();
    currencyName = TextEditingController();
    currencyId = TextEditingController();
  }

  @override
  void dispose() {
    contAdsName.dispose();
    contAdsDesc.dispose();
    contAdsPrice.dispose();
    contAdsArea.dispose();

    categName.dispose();
    categId.dispose();
    statusName.dispose();
    statusId.dispose();
    cityName.dispose();
    cityId.dispose();

    currencyName.dispose();
    currencyId.dispose();

    super.dispose();
  }
}
