import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/functions/Dialog.dart';

import '../../core/class/StatusRequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/hindlingData.dart';
import '../../core/functions/translateDataBase.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/address/cityData.dart';
import '../../data/datasource/remote/jobs/JobApplicationData.dart';
import '../../data/model/cityModel.dart';

class JobAddJobAppController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  JobApplicationsData jobApplicationsData = JobApplicationsData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController specialization;
  late TextEditingController yearsExperience;
  late TextEditingController fullName;
  late TextEditingController cityName;
  late TextEditingController cityId;
  late TextEditingController email;
  late TextEditingController workDescription;
  List<SelectedListItem> listSelectedCity = [];
  String phoneNumber = '';

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

  addJobApplicatoon() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "full_name": fullName.text,
        "specialization": specialization.text,
        "years_of_experience": yearsExperience.text,
        "phone_number": phoneNumber,
        "email": email.text,
        "description": workDescription.text,
        "created_at": DateTime.now().toString(),
        "address_id": cityId.text.toString(),
        "user_id": myServices.sharedPreferences.getInt("idUser").toString(),
      };
      var response = await jobApplicationsData.addJobApplication(data);
      statusRequest = hindlingData(response);
      print("------after data------------$response");
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoute.rHomeUser);
          showInfoDialog(
            "40".tr,
            "180".tr,
            dialogType: DialogType.success,
            autoHid: Duration(seconds: 3),
          );
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
    getCity();
    specialization = TextEditingController();
    yearsExperience = TextEditingController();
    fullName = TextEditingController();
    cityName = TextEditingController();
    cityId = TextEditingController();
    email = TextEditingController();
    workDescription = TextEditingController();
  }

  @override
  void dispose() {
    cityName.dispose();
    cityId.dispose();
    fullName.dispose();
    yearsExperience.dispose();
    specialization.dispose();
    email.dispose();
    workDescription.dispose();
    super.dispose();
  }
}
