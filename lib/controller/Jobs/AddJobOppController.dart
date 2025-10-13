import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syria_sell/core/functions/uploadFile.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/Dialog.dart';
import '../../core/functions/hindlingData.dart';
import '../../core/functions/translateDataBase.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/address/cityData.dart';
import '../../data/datasource/remote/jobs/JobOpportunities.dart';
import '../../data/model/cityModel.dart';

class JobAddOppController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  final MyServices myServices = Get.find();
  final JobOpportunitiesData jobOpportunitiesData =
      JobOpportunitiesData(Get.find());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController specialization;
  late TextEditingController workDescription;
  late TextEditingController companyName;
  late TextEditingController cityName;
  late TextEditingController cityId;
  late TextEditingController email;
  String phoneNumber = '';

  List<SelectedListItem> listSelectedCity = [];

  // الصور
  File? file;
  Uint8List? webImageBytes;
  String? webFileName;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    specialization = TextEditingController();
    workDescription = TextEditingController();
    companyName = TextEditingController();
    cityName = TextEditingController();
    cityId = TextEditingController();
    email = TextEditingController();
    getCity();
  }

  @override
  void dispose() {
    specialization.dispose();
    workDescription.dispose();
    companyName.dispose();
    cityName.dispose();
    cityId.dispose();
    email.dispose();
    super.dispose();
  }

  /// اختيار صورة (عرض الخيارات)
  void optionImage() {
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
                  imageCamera();
                },
              ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("136".tr),
              onTap: () {
                Get.back();
                imageGallery();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// فتح الكاميرا (Mobile فقط)
  Future<void> imageCamera() async {
    if (kIsWeb) {
      Get.snackbar("153".tr, "212".tr);
      return;
    }
    File? picked = await imageUploadCamera();
    if (picked != null) {
      file = picked;
      webImageBytes = null;
      webFileName = null;
      update();
    }
  }

  /// اختيار صورة من المعرض
  Future<void> imageGallery() async {
    if (kIsWeb) {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        webFileName = pickedFile.name;
        webImageBytes = await pickedFile.readAsBytes();
        file = null;
      }
    } else {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        file = File(pickedFile.path);
        webImageBytes = null;
        webFileName = null;
      }
    }
    update();
  }

  /// إزالة الصورة
  void removeImage() {
    file = null;
    webImageBytes = null;
    webFileName = null;
    update();
  }

  /// جلب المدن
  Future<void> getCity() async {
    CityData cityData = CityData(Get.find());
    statusRequest = StatusRequest.loading;
    update();

    var response = await cityData.getData();
    statusRequest = hindlingData(response);

    if (StatusRequest.success == statusRequest &&
        response["status"] == "success") {
      listSelectedCity.clear();
      List<CityModel> listCity =
          (response["data"] as List).map((e) => CityModel.fromJson(e)).toList();
      for (var city in listCity) {
        listSelectedCity.add(
          SelectedListItem(
            name: translateDataBase(city.city!, city.cityAr!),
            value: city.id!.toString(),
          ),
        );
      }
    } else if (StatusRequest.success == statusRequest) {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  /// إضافة فرصة عمل
  Future<void> addOpportunity() async {
    if (!formKey.currentState!.validate()) return;

    statusRequest = StatusRequest.loading;
    update();

    Map<String, dynamic> data = {
      "company_name": companyName.text,
      "specialization": specialization.text,
      "description": workDescription.text,
      "phone": phoneNumber,
      "email": email.text,
      "created_at": DateTime.now().toString(),
      "address_id": cityId.text,
      "user_id": myServices.sharedPreferences.getInt("idUser"),
    };

    dynamic response;
    if (kIsWeb) {
      response = await jobOpportunitiesData.addJobOpportunityWeb(
          data, webImageBytes, webFileName);
      print(response);
    } else {
      response = await jobOpportunitiesData.addJobOpportunity(data, file);
      print(response);
    }

    statusRequest = hindlingData(response);
    if (StatusRequest.success == statusRequest &&
        response["status"] == "success") {
      Get.offNamed(AppRoute.rHomeUser);
      showInfoDialog("40".tr, "180".tr,
          dialogType: DialogType.success, autoHid: Duration(seconds: 3));
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
