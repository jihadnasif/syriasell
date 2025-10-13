import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syria_sell/data/datasource/remote/Auth/ForGetPass/ResetPassData.dart';

import '../../../core/class/StatusRequest.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/hindlingData.dart';

abstract class ControllerResetPassword extends GetxController {
  ResetPassword();
}

class ControllerResetPasswordImp extends ControllerResetPassword {
  late TextEditingController NewPassword;
  late TextEditingController RepetNewPassword;
  String? email;
  String? phone;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ResetPassData resetPassData = ResetPassData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  bool isShowPass = true;
  isShowPassFun() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  @override
  ResetPassword() async {
    if (NewPassword.text != RepetNewPassword.text) {
      return Get.defaultDialog(
        title: "32".tr,
        middleText: "37".tr,
      );
    }
    var formData = formstate.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPassData.postData(
        email ?? '',
        phone ?? '',
        NewPassword.text,
      );
      statusRequest = hindlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.toNamed(AppRoute.rSuccessResetPassword);
          print("valid ok");
        } else {
          Get.defaultDialog(
            title: "warning",
            middleText: "try again",
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void dispose() {
    NewPassword.dispose();
    RepetNewPassword.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    phone = Get.arguments["phone"];
    //email = "aa@vv.vom";
    NewPassword = TextEditingController();
    RepetNewPassword = TextEditingController();
    super.onInit();
  }
}
