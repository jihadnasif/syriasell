import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: file_names
import 'package:syria_sell/core/class/StatusRequest.dart';
import 'package:syria_sell/core/functions/hindlingData.dart';
import 'package:syria_sell/data/datasource/remote/Auth/signupData.dart';

import '../../core/constant/routes.dart';
import '../../core/functions/ArabicToEnglish.dart';

abstract class ControllerSignUp extends GetxController {
  SignUp();
  GoToSignIn();
}

class ControllerSignUpImp extends ControllerSignUp {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isShowPass = true;
  String phone = '';
  late TextEditingController contPassword;
  late TextEditingController contName;
  late TextEditingController contConfirmPassword;

  StatusRequest statusRequest = StatusRequest.none;
  SignupData signupData = SignupData(Get.find());

  isShowPassFun() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  @override
  GoToSignIn() {
    Get.offAllNamed(AppRoute.rSignIn);
  }

  @override
  SignUp() async {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      phone = convertArabicToEnglishDigits(phone).replaceAll('+', '');
      ;

      print("00000000000");
      var response = await signupData.postData(
        contName.text,
        contPassword.text,
        phone,
      );
      print("Response from server: $response");
      statusRequest = hindlingData(response);
      //print("Response from server: $response");
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoute.rVerificationCodeSignUp, arguments: {
            "phone": phone,
          });

          print("-------valid ok------------");
        } else {
          print("-------2------------");
          Get.defaultDialog(
            title: "33".tr,
            middleText: "34".tr,
          );
          statusRequest = StatusRequest.failure;
        }
      } else {
        print("-------3------------");
        Get.defaultDialog(
          title: "33".tr,
          middleText: "34".tr,
        );
      }
      update();
    }
  }

  @override
  void onInit() {
    contPassword = TextEditingController();
    contConfirmPassword = TextEditingController();
    contName = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    contPassword.dispose();
    contConfirmPassword.dispose();
    contName.dispose();
    super.dispose();
  }
}
