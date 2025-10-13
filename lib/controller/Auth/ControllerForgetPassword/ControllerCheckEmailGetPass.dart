import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/core/class/StatusRequest.dart';
import 'package:syria_sell/core/functions/hindlingData.dart';
import 'package:syria_sell/data/datasource/remote/Auth/ForGetPass/CheckEmailPassData.dart';

import '../../../core/constant/routes.dart';

abstract class ControllerCheckEmail extends GetxController {
  goToSignUp();
  checkEmail();
}

class ControllerCheckEmailImp extends ControllerCheckEmail {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController contEmlPhon;
  StatusRequest statusRequest = StatusRequest.none;
  CheckEmailPassData checkEmailPassData = CheckEmailPassData(Get.find());
  @override
  checkEmail() async {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      String email = '';
      String phone = '';
      if (contEmlPhon.text.contains('@')) {
        email = contEmlPhon.text;
      } else {
        phone = contEmlPhon.text;
      }
      var response = await checkEmailPassData.postData(email, phone);
      statusRequest = hindlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          print("-----1--------");
          Map<String, String> arguments = {};

          /*if (email.isNotEmpty) {
            arguments["email"] = email;
          } else*/
          if (phone.isNotEmpty) {
            arguments["phone"] = phone;
          }
          print("-----2--------");

          Get.toNamed(AppRoute.rVerificationCodeRePass, arguments: arguments);
          print("-----3--------");
          print("valid");
        }
      } else {
        Get.defaultDialog(
          title: "32".tr,
          middleText: "38".tr,
        );
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  goToSignUp() {
    Get.toNamed(AppRoute.rSignUp);
  }

  @override
  void onInit() {
    contEmlPhon = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    contEmlPhon.dispose();
    super.dispose();
  }
}
